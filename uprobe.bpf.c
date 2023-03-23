#include "common.h"
#include "bpf_tracing.h"

char __license[] SEC("license") = "Dual MIT/GPL";

struct event {
	u32 pid;
	u64 param1;
	u64 param2;
	u64 result1;
};

struct {
	__uint(type, BPF_MAP_TYPE_RINGBUF);
	__uint(max_entries, 1 << 24);
} rb SEC(".maps");

// Force emitting struct event into the ELF.
const struct event *unused __attribute__((unused));

SEC("uprobe/add")
int uprobe_add(struct pt_regs *ctx) {
	struct event* e;
    e = bpf_ringbuf_reserve(&rb, sizeof(struct event), 0);
    if (!e) {
        return 0;
    }

	e->pid = bpf_get_current_pid_tgid();
	e->param1 = PT_REGS_RC(ctx);
	e->param2 = ctx->rbx;

	bpf_ringbuf_submit(e, 0);
	return 0;
}

SEC("uretprobe/add")
int uretprobe_add(struct pt_regs *ctx) {
	struct event* e;
    e = bpf_ringbuf_reserve(&rb, sizeof(struct event), 0);
    if (!e) {
        return 0;
    }

	e->pid = bpf_get_current_pid_tgid();
    e->result1 = PT_REGS_RC(ctx);

    bpf_ringbuf_submit(e, 0);
	return 0;
}


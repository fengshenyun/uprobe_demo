	.text
	.file	"uprobe.bpf.c"
	.section	"uprobe/add","ax",@progbits
	.globl	uprobe_add                      # -- Begin function uprobe_add
	.p2align	3
	.type	uprobe_add,@function
uprobe_add:                             # @uprobe_add
# %bb.0:
	r6 = r1
	r1 = rb ll
	r2 = 32
	r3 = 0
	call 131
	r7 = r0
	if r7 == 0 goto LBB0_2
# %bb.1:
	call 14
	*(u32 *)(r7 + 0) = r0
	r1 = *(u64 *)(r6 + 80)
	*(u64 *)(r7 + 8) = r1
	r1 = *(u64 *)(r6 + 40)
	*(u64 *)(r7 + 16) = r1
	r1 = r7
	r2 = 0
	call 132
LBB0_2:
	r0 = 0
	exit
.Lfunc_end0:
	.size	uprobe_add, .Lfunc_end0-uprobe_add
                                        # -- End function
	.section	"uretprobe/add","ax",@progbits
	.globl	uretprobe_add                   # -- Begin function uretprobe_add
	.p2align	3
	.type	uretprobe_add,@function
uretprobe_add:                          # @uretprobe_add
# %bb.0:
	r6 = r1
	r1 = rb ll
	r2 = 32
	r3 = 0
	call 131
	r7 = r0
	if r7 == 0 goto LBB1_2
# %bb.1:
	call 14
	*(u32 *)(r7 + 0) = r0
	r1 = *(u64 *)(r6 + 80)
	*(u64 *)(r7 + 24) = r1
	r1 = r7
	r2 = 0
	call 132
LBB1_2:
	r0 = 0
	exit
.Lfunc_end1:
	.size	uretprobe_add, .Lfunc_end1-uretprobe_add
                                        # -- End function
	.type	__license,@object               # @__license
	.section	license,"aw",@progbits
	.globl	__license
__license:
	.asciz	"Dual MIT/GPL"
	.size	__license, 13

	.type	rb,@object                      # @rb
	.section	.maps,"aw",@progbits
	.globl	rb
	.p2align	3
rb:
	.zero	16
	.size	rb, 16

	.type	unused,@object                  # @unused
	.section	.bss,"aw",@nobits
	.globl	unused
	.p2align	3
unused:
	.quad	0
	.size	unused, 8

	.addrsig
	.addrsig_sym uprobe_add
	.addrsig_sym uretprobe_add
	.addrsig_sym __license
	.addrsig_sym rb

/*
 *  Copyright (C) 2013, 2015  Reto Buerki <reet@codelabs.ch>
 *  Copyright (C) 2013, 2015  Adrian-Ken Rueegsegger <ken@codelabs.ch>
 *
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

.section .rodata
.global isrlist
isrlist:

.text

.macro isr_entry
	.align 4, 0x90
1:	.section .rodata
	.quad 1b
	.previous
.endm

.macro exception_with_code vector
	isr_entry
	push $\vector
	jmp handle_all
.endm

.macro exception vector
	isr_entry
	push $0
	push $\vector
	jmp handle_all
.endm

handle_all:
	push %r15
	push %r14
	push %r13
	push %r12
	push %r11
	push %r10
	push %r9
	push %r8
	push %rbp
	push %rsi
	push %rdi
	push %rdx
	push %rcx
	push %rbx
	push %rax
	mov %cr2, %rax
	push %rax
	mov %rsp, %rdi

	call dispatch_interrupt
1:
	hlt
	jmp 1b

exception				0
exception				1
exception				2
exception				3
exception				4
exception				5
exception				6
exception				7
exception_with_code 	8
exception				9
exception_with_code		10
exception_with_code		11
exception_with_code		12
exception_with_code		13
exception_with_code		14
exception				15
exception				16
exception_with_code		17

.set vec, 18
.rept 31-17
exception vec
.set vec, vec + 1
.endr

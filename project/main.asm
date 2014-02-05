.org 0x2100
.db "MN"
.orgfill 0x2102
	jmp	vbcc___interrupt_handler_0
.orgfill 0x2108
	jmp	vbcc___interrupt_handler_1
.orgfill 0x210e
	jmp	vbcc___interrupt_handler_2
.orgfill 0x2114
	jmp	vbcc___interrupt_handler_3
.orgfill 0x211a
	jmp	vbcc___interrupt_handler_4
.orgfill 0x2120
	jmp	vbcc___interrupt_handler_5
.orgfill 0x2126
	jmp	vbcc___interrupt_handler_6
.orgfill 0x212c
	jmp	vbcc___interrupt_handler_7
.orgfill 0x2132
	jmp	vbcc___interrupt_handler_8
.orgfill 0x2138
	jmp	vbcc___interrupt_handler_9
.orgfill 0x213e
	jmp	vbcc___interrupt_handler_10
.orgfill 0x2144
	jmp	vbcc___interrupt_handler_11
.orgfill 0x214a
	jmp	vbcc___interrupt_handler_12
.orgfill 0x2150
	jmp	vbcc___interrupt_handler_13
.orgfill 0x2156
	jmp	vbcc___interrupt_handler_14
.orgfill 0x215c
	jmp	vbcc___interrupt_handler_15
.orgfill 0x2162
	jmp	vbcc___interrupt_handler_16
.orgfill 0x2168
	jmp	vbcc___interrupt_handler_17
.orgfill 0x216e
	jmp	vbcc___interrupt_handler_18
.orgfill 0x2174
	jmp	vbcc___interrupt_handler_19
.orgfill 0x217a
	jmp	vbcc___interrupt_handler_20
.orgfill 0x2180
	jmp	vbcc___interrupt_handler_21
.orgfill 0x2186
	jmp	vbcc___interrupt_handler_22
.orgfill 0x218c
	jmp	vbcc___interrupt_handler_23
.orgfill 0x2192
	jmp	vbcc___interrupt_handler_24
.orgfill 0x2198
	jmp	vbcc___interrupt_handler_25
.orgfill 0x21A4
.db "NINTENDO"
.db "PKCC"
.db "PokeCCbyZC"
.orgfill 0x21BC
.db "2P"
.orgfill 0x21D0
vbcc___start_rom_vars:
.org 0x1000
vbcc___start_ram_vars:
.org 0x2000
vbcc___end_ram_vars:
.org 0x31D0
.equ  vbcc___ram_vars_offset 5344 - 0x1000
vbcc___interrupt_handler_0:
	mov		x, vbcc___start_rom_vars + vbcc___ram_vars_offset
	mov		y, vbcc___start_ram_vars + vbcc___ram_vars_offset
	mov		hl, vbcc___end_ram_vars
vbcc__copy_vars_loop:
	mov		a,[x]
	mov		[y],a
	inc		x
	inc		y
	cmp		hl, y
	jnz		vbcc__copy_vars_loop
	movw	sp, 0x2000
	movw	nn, 0x2000
	movb	[nn+0x21], 0x0C
	movb	[nn+0x25], (1<<7)
	movb	flags, 0
	movb	[nn+0x80], 0b00001000
	movb	[nn+0x81], 0b00001001
	call	main
vbcc___infinite_loop:
	jmp	vbcc___infinite_loop

print_ch:
	sub	sp,8
	mov	ba,[sp+11]
	mov	hl,[sx]
	mov	x,ba
	mov	ba,x
	sub	ba,hl
	mov	x,ba
	mov	hl,16
	mov	ba,x
	mov	ba,x
	call	vbcc___div_mod16x16_16
	mov	ba, hl
	mov	x,ba
	mov	hl,6
	mov	ba,x
	mov	ba,x
	call	vbcc___mul16x16_16
	mov	x,ba
	mov	hl,4096
	mov	ba,x
	add	ba,hl
	mov	x,ba
	mov	ba,[sp+13]
	mov	hl,[sy]
	mov	y,ba
	mov	ba,y
	add	ba,hl
	mov	y,ba
	mov	hl,96
	mov	ba,y
	mov	ba,y
	call	vbcc___mul16x16_16
	mov	y,ba
	mov	ba,x
	add	ba,y
	mov	x,ba
	mov	ba,x
	mov	[sp+6],ba
	mov	ba,[sp+15]
	mov	b,0
	mov	x,ba
	mov	hl,64
	mov	ba,x
	cmp	ba,hl
	jz	vbcc___l13
	jmp	vbcc___l3
vbcc___l13:
vbcc___l2:
	mov	ba,[sy]
	mov	hl,1
	add	ba,hl
	mov	[sy],ba
	mov	ba,[sp+11]
	mov	[sx],ba
vbcc___l3:
	mov	ba,[sp+15]
	mov	b,0
	mov	x,ba
	mov	hl,32
	mov	ba,x
	cmp	ba,hl
	jl	vbcc___l14
	jmp	vbcc___l5
vbcc___l14:
vbcc___l4:
	mov	a,0
	mov	x,sp
	mov	[x+15],a
	jmp	vbcc___l6
vbcc___l5:
	mov	ba,[sp+15]
	mov	b,0
	mov	x,ba
	mov	hl,32
	mov	y,x
	mov	ba,y
	sub	ba,hl
	mov	y,ba
	mov	ba,y
	mov	x,sp
	mov	[x+15],a
vbcc___l6:
	mov	ba,[sp+15]
	mov	b,0
	mov	x,ba
	mov	hl,160
	mov	ba,x
	cmp	ba,hl
	jge	vbcc___l15
	jmp	vbcc___l8
vbcc___l15:
vbcc___l7:
	mov	a,0
	mov	x,sp
	mov	[x+15],a
vbcc___l8:
	mov	ba,[sp+15]
	mov	b,0
	mov	x,ba
	mov	hl,5
	mov	ba,x
	mov	ba,x
	call	vbcc___mul16x16_16
	mov	x,ba
	mov	ba,char_font
	add	ba,x
	mov	y,ba
	mov	ba,y
	mov	[sp+4],ba
	mov	ba,0
	mov	[sp+0],ba
	jmp	vbcc___l10
vbcc___l9:
	mov	ba,[sp+4]
	mov	x,ba
	mov	ba,[sp+4]
	mov	hl,1
	add	ba,hl
	mov	[sp+4],ba
	mov	ba,[sp+6]
	mov	y,ba
	mov	ba,[sp+6]
	mov	hl,1
	add	ba,hl
	mov	[sp+6],ba
	mov	a,[x]
	mov	[y],a
vbcc___l12:
	mov	ba,[sp+0]
	mov	hl,1
	add	ba,hl
	mov	[sp+0],ba
vbcc___l10:
	mov	ba,[sp+0]
	mov	hl,5
	cmp	ba,hl
	jge	vbcc___l16
	jmp	vbcc___l9
vbcc___l16:
vbcc___l11:
	mov	ba,[sp+6]
	mov	x,ba
	mov	ba,[sp+6]
	mov	hl,1
	add	ba,hl
	mov	[sp+6],ba
	mov	a,0
	mov	[x],a
vbcc___l1:
	add	sp,8
	ret

print_digit:
	mov	ba,[sp+7]
	mov	hl,0
	cmp	ba,hl
	jge	vbcc___l26
	jmp	vbcc___l19
vbcc___l26:
vbcc___l20:
	mov	ba,[sp+7]
	mov	hl,9
	cmp	ba,hl
	jle	vbcc___l27
	jmp	vbcc___l19
vbcc___l27:
vbcc___l18:
	mov	ba,[sp+7]
	mov	hl,48
	add	ba,hl
	mov	[sp+7],ba
	jmp	vbcc___l21
vbcc___l19:
	mov	ba,[sp+7]
	mov	hl,10
	cmp	ba,hl
	jge	vbcc___l28
	jmp	vbcc___l23
vbcc___l28:
vbcc___l24:
	mov	ba,[sp+7]
	mov	hl,15
	cmp	ba,hl
	jle	vbcc___l29
	jmp	vbcc___l23
vbcc___l29:
vbcc___l22:
	mov	ba,[sp+7]
	mov	hl,55
	add	ba,hl
	mov	[sp+7],ba
	jmp	vbcc___l25
vbcc___l23:
	mov	ba,63
	mov	[sp+7],ba
vbcc___l25:
vbcc___l21:
	mov	ba,[sp+7]
	push	ba
	mov	ba,[sp+7]
	push	ba
	mov	ba,[sp+7]
	push	ba
	call	print_ch
	add	sp,6
vbcc___l17:
	ret

print_dec:
	sub	sp,2
	mov	ba,[sp+9]
	mov	hl,0
	cmp	ba,hl
	jl	vbcc___l43
	jmp	vbcc___l32
vbcc___l43:
vbcc___l31:
	mov	ba,45
	push	ba
	mov	ba,[sp+9]
	ex	ba,a
	mov	x,ba
	push	x
	mov	ba,[sp+9]
	ex	ba,a
	mov	x,ba
	push	x
	call	print_ch
	add	sp,6
	mov	ba,[sp+5]
	ex	ba,a
	mov	x,ba
	mov	hl,1
	mov	y,x
	mov	ba,y
	add	ba,hl
	mov	y,ba
	mov	ba,y
	mov	x,sp
	mov	[x+5],a
	mov	ba,[sp+9]
	mov	hl,0
	sub	hl,ba
	mov	ba,hl
	mov	[sp+9],ba
vbcc___l32:
	mov	ba,10000
	mov	[sp+0],ba
	jmp	vbcc___l34
vbcc___l33:
	mov	ba,[sp+9]
	mov	hl,[sp+0]
	cmp	ba,hl
	jge	vbcc___l44
	jmp	vbcc___l38
vbcc___l44:
vbcc___l37:
	jmp	vbcc___l35
vbcc___l38:
vbcc___l36:
	mov	ba,[sp+0]
	mov	hl,10
	call	vbcc___div_mod16x16_16
	mov	[sp+0],ba
vbcc___l34:
	mov	ba,[sp+0]
	mov	hl,1
	cmp	ba,hl
	jle	vbcc___l45
	jmp	vbcc___l33
vbcc___l45:
vbcc___l35:
	jmp	vbcc___l40
vbcc___l39:
	mov	ba,[sp+9]
	mov	hl,[sp+0]
	call	vbcc___div_mod16x16_16
	mov	x,ba
	push	x
	mov	ba,[sp+9]
	ex	ba,a
	mov	x,ba
	push	x
	mov	ba,[sp+9]
	ex	ba,a
	mov	x,ba
	push	x
	call	print_digit
	add	sp,6
	mov	ba,[sp+9]
	mov	hl,[sp+0]
	call	vbcc___div_mod16x16_16
	mov	ba, hl
	mov	[sp+9],ba
	mov	ba,[sp+5]
	ex	ba,a
	mov	x,ba
	mov	hl,1
	mov	y,x
	mov	ba,y
	add	ba,hl
	mov	y,ba
	mov	ba,y
	mov	x,sp
	mov	[x+5],a
vbcc___l42:
	mov	ba,[sp+0]
	mov	hl,10
	call	vbcc___div_mod16x16_16
	mov	[sp+0],ba
vbcc___l40:
	mov	ba,[sp+0]
	mov	hl,1
	cmp	ba,hl
	jl	vbcc___l46
	jmp	vbcc___l39
vbcc___l46:
vbcc___l41:
vbcc___l30:
	add	sp,2
	ret

print_hex:
	sub	sp,1
	mov	a,12
	inc	sp
	push	a
	jmp	vbcc___l49
vbcc___l48:
	mov	ba,[sp+0]
	ex	ba,a
	mov	x,ba
	mov	ba,[sp+8]
	cmp	x,16
	jc	vbcc___l52
	mov	ba, 0
	jmp	vbcc___l54
vbcc___l52:
	cmp	x,0
	jz	vbcc___l54
vbcc___l53:
	shr	b
	rorc	a
	dec	x
	jnz	vbcc___l53
vbcc___l54:
	mov	x,ba
	mov	hl,15
	mov	ba,x
	push	hl
	mov	hl,sp
	and	a,[hl]
	xchg	a,b
	inc	hl
	and	a,[hl]
	xchg	a,b
	pop	hl
	mov	x,ba
	push	x
	mov	ba,[sp+8]
	ex	ba,a
	mov	x,ba
	push	x
	mov	ba,[sp+8]
	ex	ba,a
	mov	x,ba
	push	x
	call	print_digit
	add	sp,6
vbcc___l51:
	mov	ba,[sp+0]
	ex	ba,a
	mov	x,ba
	mov	hl,4
	mov	y,x
	mov	ba,y
	sub	ba,hl
	mov	y,ba
	mov	ba,y
	inc	sp
	push	a
	mov	ba,[sp+4]
	ex	ba,a
	mov	x,ba
	mov	hl,1
	mov	y,x
	mov	ba,y
	add	ba,hl
	mov	y,ba
	mov	ba,y
	mov	x,sp
	mov	[x+4],a
vbcc___l49:
	mov	ba,[sp+0]
	ex	ba,a
	mov	x,ba
	mov	hl,0
	mov	ba,x
	cmp	ba,hl
	jl	vbcc___l55
	jmp	vbcc___l48
vbcc___l55:
vbcc___l50:
vbcc___l47:
	add	sp,1
	ret

print_nline:
	mov	ba,[sy]
	mov	hl,1
	add	ba,hl
	mov	[sy],ba
vbcc___l56:
	ret

print:
	mov	ba,[sp+5]
	mov	hl,8
	call	vbcc___div_mod16x16_16
	mov	ba, hl
	mov	[sp+5],ba
	jmp	vbcc___l59
vbcc___l58:
	mov	hl,[sp+7]
	mov	a,[hl]
	ex	ba,a
	mov	x,ba
	push	x
	mov	ba,[sp+7]
	push	ba
	mov	ba,[sp+7]
	mov	x,ba
	mov	ba,[sp+7]
	mov	hl,1
	add	ba,hl
	mov	[sp+7],ba
	push	x
	call	print_ch
	add	sp,6
vbcc___l61:
	mov	ba,[sp+7]
	mov	hl,1
	add	ba,hl
	mov	[sp+7],ba
vbcc___l59:
	mov	hl,[sp+7]
	mov	a,[hl]
	cmp	a,0
	jz	vbcc___l62
	jmp	vbcc___l58
vbcc___l62:
vbcc___l60:
vbcc___l57:
	ret

clear_screen:
	sub	sp,4
	mov	ba,4096
	mov	[sp+2],ba
	mov	ba,0
	mov	[sp+0],ba
	jmp	vbcc___l66
vbcc___l65:
	mov	ba,[sp+2]
	mov	x,ba
	mov	ba,[sp+2]
	mov	hl,1
	add	ba,hl
	mov	[sp+2],ba
	mov	a,0
	mov	[x],a
vbcc___l68:
	mov	ba,[sp+0]
	mov	hl,1
	add	ba,hl
	mov	[sp+0],ba
vbcc___l66:
	mov	ba,[sp+0]
	mov	hl,768
	cmp	ba,hl
	jge	vbcc___l69
	jmp	vbcc___l65
vbcc___l69:
vbcc___l67:
vbcc___l64:
	add	sp,4
	ret

print_ch2:
	sub	sp,6
	mov	ba,[sp+9]
	mov	hl,6
	call	vbcc___mul16x16_16
	mov	x,ba
	mov	hl,4096
	mov	ba,x
	add	ba,hl
	mov	x,ba
	mov	ba,[sp+11]
	mov	hl,96
	call	vbcc___mul16x16_16
	mov	y,ba
	mov	ba,x
	add	ba,y
	mov	x,ba
	mov	ba,x
	mov	[sp+4],ba
	mov	ba,[sp+13]
	mov	b,0
	mov	x,ba
	mov	hl,32
	mov	ba,x
	cmp	ba,hl
	jl	vbcc___l80
	jmp	vbcc___l72
vbcc___l80:
vbcc___l71:
	mov	a,0
	mov	x,sp
	mov	[x+13],a
	jmp	vbcc___l73
vbcc___l72:
	mov	ba,[sp+13]
	mov	b,0
	mov	x,ba
	mov	hl,32
	mov	y,x
	mov	ba,y
	sub	ba,hl
	mov	y,ba
	mov	ba,y
	mov	x,sp
	mov	[x+13],a
vbcc___l73:
	mov	ba,[sp+13]
	mov	b,0
	mov	x,ba
	mov	hl,160
	mov	ba,x
	cmp	ba,hl
	jge	vbcc___l81
	jmp	vbcc___l75
vbcc___l81:
vbcc___l74:
	mov	a,0
	mov	x,sp
	mov	[x+13],a
vbcc___l75:
	mov	ba,[sp+13]
	mov	b,0
	mov	x,ba
	mov	hl,5
	mov	ba,x
	mov	ba,x
	call	vbcc___mul16x16_16
	mov	x,ba
	mov	ba,char_font
	add	ba,x
	mov	y,ba
	mov	ba,y
	mov	[sp+2],ba
	mov	ba,0
	mov	[sp+0],ba
	jmp	vbcc___l77
vbcc___l76:
	mov	ba,[sp+2]
	mov	x,ba
	mov	ba,[sp+2]
	mov	hl,1
	add	ba,hl
	mov	[sp+2],ba
	mov	ba,[sp+4]
	mov	y,ba
	mov	ba,[sp+4]
	mov	hl,1
	add	ba,hl
	mov	[sp+4],ba
	mov	a,[x]
	mov	[y],a
vbcc___l79:
	mov	ba,[sp+0]
	mov	hl,1
	add	ba,hl
	mov	[sp+0],ba
vbcc___l77:
	mov	ba,[sp+0]
	mov	hl,5
	cmp	ba,hl
	jge	vbcc___l82
	jmp	vbcc___l76
vbcc___l82:
vbcc___l78:
	mov	ba,[sp+4]
	mov	x,ba
	mov	ba,[sp+4]
	mov	hl,1
	add	ba,hl
	mov	[sp+4],ba
	mov	a,0
	mov	[x],a
vbcc___l70:
	add	sp,6
	ret

print_text:
	sub	sp,2
	mov	ba,0
	mov	[sp+0],ba
	jmp	vbcc___l85
vbcc___l84:
	mov	hl,[sp+9]
	mov	a,[hl]
	ex	ba,a
	mov	x,ba
	push	x
	mov	ba,[sp+9]
	push	ba
	mov	ba,[sp+9]
	mov	x,ba
	mov	ba,[sp+9]
	mov	hl,1
	add	ba,hl
	mov	[sp+9],ba
	push	x
	call	print_ch2
	add	sp,6
vbcc___l87:
	mov	ba,[sp+9]
	mov	hl,1
	add	ba,hl
	mov	[sp+9],ba
	mov	ba,[sp+0]
	mov	x,ba
	mov	ba,[sp+0]
	mov	hl,1
	add	ba,hl
	mov	[sp+0],ba
vbcc___l85:
	mov	ba,[sp+0]
	mov	hl,112
	cmp	ba,hl
	jge	vbcc___l88
	jmp	vbcc___l84
vbcc___l88:
vbcc___l86:
vbcc___l83:
	add	sp,2
	ret
vbcc___interrupt_handler_1:
	pushax

irq_1_prc_copy:
	sub	sp,2
	mov	a,1
	mov	hl,8233
	mov	[hl],a
	mov	hl,8274
	mov	a,[hl]
	ex	ba,a
	mov	x,ba
	mov	hl,4
	mov	ba,x
	push	hl
	mov	hl,sp
	and	a,[hl]
	xchg	a,b
	inc	hl
	and	a,[hl]
	xchg	a,b
	pop	hl
	mov	x,ba
	mov	ba,x
	cmp	ba,0
	jz	vbcc___l149
	jmp	vbcc___l93
vbcc___l149:
vbcc___l92:
	call	clear_screen
	mov	ba,[ny]
	mov	hl,1
	add	ba,hl
	mov	[ny],ba
	mov	ba,[ny]
	mov	hl,1
	mov	x,ba
	mov	ba,x
	sub	ba,hl
	mov	x,ba
	mov	hl,4
	mov	ba,x
	cmp	hl,16
	jc	vbcc___l150
	mov	ba, 0
	jmp	vbcc___l152
vbcc___l150:
	cmp	hl,0
	jz	vbcc___l152
vbcc___l151:
	shl	a
	rolc	b
	dec	hl
	jnz	vbcc___l151
vbcc___l152:
	mov	x,ba
	mov	ba,vbcc___l90
	add	ba,x
	mov	y,ba
	mov	hl,[nx]
	mov	ba,y
	add	ba,hl
	mov	y,ba
	push	y
	mov	ba,0
	push	ba
	mov	ba,0
	push	ba
	call	print_text
	add	sp,6
	mov	ba,[ny]
	push	ba
	mov	ba,7
	push	ba
	mov	ba,12
	push	ba
	call	print_hex
	add	sp,6
vbcc___l93:
	mov	hl,8274
	mov	a,[hl]
	ex	ba,a
	mov	x,ba
	mov	hl,16
	mov	ba,x
	push	hl
	mov	hl,sp
	and	a,[hl]
	xchg	a,b
	inc	hl
	and	a,[hl]
	xchg	a,b
	pop	hl
	mov	x,ba
	mov	ba,x
	cmp	ba,0
	jz	vbcc___l153
	jmp	vbcc___l95
vbcc___l153:
vbcc___l96:
	mov	ba,[Button_DOWN]
	cmp	ba,0
	jz	vbcc___l154
	jmp	vbcc___l95
vbcc___l154:
vbcc___l94:
	call	clear_screen
	mov	ba,[ny]
	mov	hl,1
	add	ba,hl
	mov	[ny],ba
	mov	ba,[ny]
	mov	hl,1
	mov	x,ba
	mov	ba,x
	sub	ba,hl
	mov	x,ba
	mov	hl,4
	mov	ba,x
	cmp	hl,16
	jc	vbcc___l155
	mov	ba, 0
	jmp	vbcc___l157
vbcc___l155:
	cmp	hl,0
	jz	vbcc___l157
vbcc___l156:
	shl	a
	rolc	b
	dec	hl
	jnz	vbcc___l156
vbcc___l157:
	mov	x,ba
	mov	ba,vbcc___l90
	add	ba,x
	mov	y,ba
	mov	hl,[nx]
	mov	ba,y
	add	ba,hl
	mov	y,ba
	push	y
	mov	ba,0
	push	ba
	mov	ba,0
	push	ba
	call	print_text
	add	sp,6
	mov	ba,[ny]
	push	ba
	mov	ba,7
	push	ba
	mov	ba,12
	push	ba
	call	print_hex
	add	sp,6
	mov	ba,1
	mov	[Button_DOWN],ba
	jmp	vbcc___l97
vbcc___l95:
	mov	ba,[Button_DOWN]
	cmp	ba,0
	jnz	vbcc___l158
	jmp	vbcc___l99
vbcc___l158:
	mov	ba,0
	mov	[sp+0],ba
	jmp	vbcc___l101
vbcc___l100:
vbcc___l103:
	mov	ba,[sp+0]
	mov	hl,1
	add	ba,hl
	mov	[sp+0],ba
vbcc___l101:
	mov	ba,[sp+0]
	mov	hl,2500
	cmp	ba,hl
	jge	vbcc___l159
	jmp	vbcc___l100
vbcc___l159:
vbcc___l102:
vbcc___l99:
	mov	ba,0
	mov	[Button_DOWN],ba
vbcc___l97:
	mov	hl,8274
	mov	a,[hl]
	ex	ba,a
	mov	x,ba
	mov	hl,8
	mov	ba,x
	push	hl
	mov	hl,sp
	and	a,[hl]
	xchg	a,b
	inc	hl
	and	a,[hl]
	xchg	a,b
	pop	hl
	mov	x,ba
	mov	ba,x
	cmp	ba,0
	jz	vbcc___l160
	jmp	vbcc___l105
vbcc___l160:
vbcc___l107:
	mov	ba,[Button_DOWN]
	cmp	ba,0
	jz	vbcc___l161
	jmp	vbcc___l105
vbcc___l161:
vbcc___l106:
	mov	ba,[ny]
	cmp	ba,0
	jnz	vbcc___l162
	jmp	vbcc___l105
vbcc___l162:
vbcc___l108:
	mov	ba,[ny]
	mov	hl,1
	cmp	ba,hl
	jnz	vbcc___l163
	jmp	vbcc___l105
vbcc___l163:
vbcc___l104:
	call	clear_screen
	mov	ba,[ny]
	mov	hl,1
	sub	ba,hl
	mov	[ny],ba
	mov	ba,[ny]
	mov	hl,1
	mov	x,ba
	mov	ba,x
	sub	ba,hl
	mov	x,ba
	mov	hl,4
	mov	ba,x
	cmp	hl,16
	jc	vbcc___l164
	mov	ba, 0
	jmp	vbcc___l166
vbcc___l164:
	cmp	hl,0
	jz	vbcc___l166
vbcc___l165:
	shl	a
	rolc	b
	dec	hl
	jnz	vbcc___l165
vbcc___l166:
	mov	x,ba
	mov	ba,vbcc___l90
	add	ba,x
	mov	y,ba
	mov	hl,[nx]
	mov	ba,y
	add	ba,hl
	mov	y,ba
	push	y
	mov	ba,0
	push	ba
	mov	ba,0
	push	ba
	call	print_text
	add	sp,6
	mov	ba,[ny]
	push	ba
	mov	ba,7
	push	ba
	mov	ba,12
	push	ba
	call	print_hex
	add	sp,6
	mov	ba,1
	mov	[Button_DOWN],ba
	jmp	vbcc___l109
vbcc___l105:
	mov	ba,[Button_DOWN]
	cmp	ba,0
	jnz	vbcc___l167
	jmp	vbcc___l111
vbcc___l167:
	mov	ba,0
	mov	[sp+0],ba
	jmp	vbcc___l113
vbcc___l112:
vbcc___l115:
	mov	ba,[sp+0]
	mov	hl,1
	add	ba,hl
	mov	[sp+0],ba
vbcc___l113:
	mov	ba,[sp+0]
	mov	hl,2500
	cmp	ba,hl
	jge	vbcc___l168
	jmp	vbcc___l112
vbcc___l168:
vbcc___l114:
vbcc___l111:
	mov	ba,0
	mov	[Button_DOWN],ba
vbcc___l109:
	mov	hl,8274
	mov	a,[hl]
	ex	ba,a
	mov	x,ba
	mov	hl,64
	mov	ba,x
	push	hl
	mov	hl,sp
	and	a,[hl]
	xchg	a,b
	inc	hl
	and	a,[hl]
	xchg	a,b
	pop	hl
	mov	x,ba
	mov	ba,x
	cmp	ba,0
	jz	vbcc___l169
	jmp	vbcc___l117
vbcc___l169:
vbcc___l118:
	mov	ba,[Button_DOWN]
	cmp	ba,0
	jz	vbcc___l170
	jmp	vbcc___l117
vbcc___l170:
vbcc___l116:
	call	clear_screen
	mov	ba,[nx]
	mov	hl,1
	add	ba,hl
	mov	[nx],ba
	mov	ba,[nx]
	mov	hl,16
	cmp	ba,hl
	jz	vbcc___l120
	jc	vbcc___l120
vbcc___l171:
vbcc___l119:
	mov	ba,1
	mov	[nx],ba
	mov	ba,[ny]
	mov	hl,1
	add	ba,hl
	mov	[ny],ba
vbcc___l120:
	mov	ba,[ny]
	mov	hl,1
	mov	x,ba
	mov	ba,x
	sub	ba,hl
	mov	x,ba
	mov	hl,4
	mov	ba,x
	cmp	hl,16
	jc	vbcc___l172
	mov	ba, 0
	jmp	vbcc___l174
vbcc___l172:
	cmp	hl,0
	jz	vbcc___l174
vbcc___l173:
	shl	a
	rolc	b
	dec	hl
	jnz	vbcc___l173
vbcc___l174:
	mov	x,ba
	mov	ba,vbcc___l90
	add	ba,x
	mov	y,ba
	mov	hl,[nx]
	mov	ba,y
	add	ba,hl
	mov	y,ba
	push	y
	mov	ba,0
	push	ba
	mov	ba,0
	push	ba
	call	print_text
	add	sp,6
	mov	ba,[ny]
	cmp	ba,0
	jz	vbcc___l175
	jmp	vbcc___l122
vbcc___l175:
vbcc___l121:
	mov	ba,1
	push	ba
	mov	ba,7
	push	ba
	mov	ba,12
	push	ba
	call	print_hex
	add	sp,6
	jmp	vbcc___l123
vbcc___l122:
	mov	ba,[ny]
	push	ba
	mov	ba,7
	push	ba
	mov	ba,12
	push	ba
	call	print_hex
	add	sp,6
vbcc___l123:
	mov	ba,[ny]
	push	ba
	mov	ba,7
	push	ba
	mov	ba,12
	push	ba
	call	print_hex
	add	sp,6
	mov	ba,1
	mov	[Button_DOWN],ba
	jmp	vbcc___l124
vbcc___l117:
	mov	ba,[Button_DOWN]
	cmp	ba,0
	jnz	vbcc___l176
	jmp	vbcc___l126
vbcc___l176:
	mov	ba,0
	mov	[sp+0],ba
	jmp	vbcc___l128
vbcc___l127:
vbcc___l130:
	mov	ba,[sp+0]
	mov	hl,1
	add	ba,hl
	mov	[sp+0],ba
vbcc___l128:
	mov	ba,[sp+0]
	mov	hl,2500
	cmp	ba,hl
	jge	vbcc___l177
	jmp	vbcc___l127
vbcc___l177:
vbcc___l129:
vbcc___l126:
	mov	ba,0
	mov	[Button_DOWN],ba
vbcc___l124:
	mov	hl,8274
	mov	a,[hl]
	ex	ba,a
	mov	x,ba
	mov	hl,32
	mov	ba,x
	push	hl
	mov	hl,sp
	and	a,[hl]
	xchg	a,b
	inc	hl
	and	a,[hl]
	xchg	a,b
	pop	hl
	mov	x,ba
	mov	ba,x
	cmp	ba,0
	jz	vbcc___l178
	jmp	vbcc___l132
vbcc___l178:
vbcc___l135:
	mov	ba,[Button_DOWN]
	cmp	ba,0
	jz	vbcc___l179
	jmp	vbcc___l132
vbcc___l179:
vbcc___l134:
	mov	ba,[nx]
	cmp	ba,0
	jz	vbcc___l180
	jmp	vbcc___l133
vbcc___l180:
vbcc___l136:
	mov	ba,[ny]
	mov	hl,1
	cmp	ba,hl
	jnz	vbcc___l181
	jmp	vbcc___l132
vbcc___l181:
vbcc___l133:
	mov	ba,[ny]
	cmp	ba,0
	jnz	vbcc___l182
	jmp	vbcc___l132
vbcc___l182:
vbcc___l131:
	call	clear_screen
	mov	ba,[nx]
	mov	hl,1
	sub	ba,hl
	mov	[nx],ba
	mov	ba,[nx]
	cmp	ba,0
	jz	vbcc___l183
	jmp	vbcc___l138
vbcc___l183:
vbcc___l137:
	mov	ba,16
	mov	[nx],ba
	mov	ba,[ny]
	mov	hl,1
	sub	ba,hl
	mov	[ny],ba
vbcc___l138:
	mov	ba,[ny]
	mov	hl,1
	mov	x,ba
	mov	ba,x
	sub	ba,hl
	mov	x,ba
	mov	hl,4
	mov	ba,x
	cmp	hl,16
	jc	vbcc___l184
	mov	ba, 0
	jmp	vbcc___l186
vbcc___l184:
	cmp	hl,0
	jz	vbcc___l186
vbcc___l185:
	shl	a
	rolc	b
	dec	hl
	jnz	vbcc___l185
vbcc___l186:
	mov	x,ba
	mov	ba,vbcc___l90
	add	ba,x
	mov	y,ba
	mov	hl,[nx]
	mov	ba,y
	add	ba,hl
	mov	y,ba
	push	y
	mov	ba,0
	push	ba
	mov	ba,0
	push	ba
	call	print_text
	add	sp,6
	mov	ba,[ny]
	cmp	ba,0
	jz	vbcc___l187
	jmp	vbcc___l140
vbcc___l187:
vbcc___l139:
	mov	ba,1
	push	ba
	mov	ba,7
	push	ba
	mov	ba,12
	push	ba
	call	print_hex
	add	sp,6
	mov	ba,1
	mov	[ny],ba
	mov	ba,0
	mov	[nx],ba
	jmp	vbcc___l141
vbcc___l140:
	mov	ba,[ny]
	push	ba
	mov	ba,7
	push	ba
	mov	ba,12
	push	ba
	call	print_hex
	add	sp,6
vbcc___l141:
	mov	ba,1
	mov	[Button_DOWN],ba
	jmp	vbcc___l142
vbcc___l132:
	mov	ba,[Button_DOWN]
	cmp	ba,0
	jnz	vbcc___l188
	jmp	vbcc___l144
vbcc___l188:
	mov	ba,0
	mov	[sp+0],ba
	jmp	vbcc___l146
vbcc___l145:
vbcc___l148:
	mov	ba,[sp+0]
	mov	hl,1
	add	ba,hl
	mov	[sp+0],ba
vbcc___l146:
	mov	ba,[sp+0]
	mov	hl,2500
	cmp	ba,hl
	jge	vbcc___l189
	jmp	vbcc___l145
vbcc___l189:
vbcc___l147:
vbcc___l144:
	mov	ba,0
	mov	[Button_DOWN],ba
vbcc___l142:
vbcc___l91:
	add	sp,2
	popax
	reti
vbcc___interrupt_handler_15:
	movb	[nn+0x29], (1<<7)
	test	[nn+0x52], (1<<7)
	jnz	vbcc___noturnoff
	cint	0x24
vbcc___noturnoff:
	reti
vbcc___interrupt_handler_2:
vbcc___interrupt_handler_3:
vbcc___interrupt_handler_4:
vbcc___interrupt_handler_5:
vbcc___interrupt_handler_6:
vbcc___interrupt_handler_7:
vbcc___interrupt_handler_8:
vbcc___interrupt_handler_9:
vbcc___interrupt_handler_10:
vbcc___interrupt_handler_11:
vbcc___interrupt_handler_12:
vbcc___interrupt_handler_13:
vbcc___interrupt_handler_14:
vbcc___interrupt_handler_16:
vbcc___interrupt_handler_17:
vbcc___interrupt_handler_18:
vbcc___interrupt_handler_19:
vbcc___interrupt_handler_20:
vbcc___interrupt_handler_21:
vbcc___interrupt_handler_22:
vbcc___interrupt_handler_23:
vbcc___interrupt_handler_24:
vbcc___interrupt_handler_25:
	reti
vbcc___mul16x16_16:
	push	hl
	mul	l, a
	push	hl
	mov	hl,[sp+3]
	mul	l, a
	mov	a, b
	mov	b, l
	mov	hl, [sp+2]
	mul	l, a
	mov	a, l
	add	a, b
	mov	b, a
	xor	a, a
	pop	hl
	add	ba, hl
	pop	hl
	ret
vbcc___div_mod16x16_16:
	push	x
	push	y
	mov	x, 0
	cmp	ba, 0
	jns	vbcc___dm_banotneg
	not	a
	not	b
	inc	ba
	add	x, 0x0011
vbcc___dm_banotneg:
	xchg	ba, hl
	cmp	ba, 0
	jns	vbcc___dm_hlnotneg
	not	a
	not	b
	inc	ba
	inc	x
vbcc___dm_hlnotneg:
	xchg	ba, hl
	push	x
	mov	x, 0
	mov	y, 1
vbcc___dm_shiftloop:
	shl	a
	rolc	b
	xchg	ba, x
	rolc	a
	rolc	b
	xchg	ba, x
	sub	x, hl
	jns	vbcc___dm_resnotneg
	add	x, hl
vbcc___dm_resnotneg:
	xchg	ba, y
	rolc	a
	rolc	b
	xchg	ba, y
	jc	vbcc___dm_done
	jmp	vbcc___dm_shiftloop
vbcc___dm_done:
	pop	ba
	tst	a, 0x10
	xchg	ba, x
	jz	vbcc___dm_modnotneg
	not	a
	not	b
	inc	ba
vbcc___dm_modnotneg:
	mov	hl, ba
	mov	ba, x
	tst	a, 0x01
	mov	ba, y
	jz	vbcc___dm_resnonegate
	inc	ba
	jmp	vbcc___dm_resnegate
vbcc___dm_resnonegate:
	not	b
	not	a
vbcc___dm_resnegate:
	pop	y
	pop	x
	ret

main:
	sub	sp,10
	mov	ba,0
	mov	[sp+4],ba
	mov	ba,0
	mov	[sp+6],ba
	mov	a,12
	mov	hl,8225
	mov	[hl],a
	mov	a,-127
	mov	hl,8229
	mov	[hl],a
	mov	ba,1
	push	ba
	mov	ba,7
	push	ba
	mov	ba,12
	push	ba
	call	print_hex
	add	sp,6
	mov	ba,vbcc___l90
	push	ba
	mov	ba,0
	push	ba
	mov	ba,0
	push	ba
	call	print_text
	add	sp,6
	mov	a,-128
	mov	hl,8227
	mov	[hl],a
	mov	hl,8224
	mov	a,[hl]
	ex	ba,a
	mov	x,ba
	mov	hl,-193
	mov	ba,x
	push	hl
	mov	hl,sp
	and	a,[hl]
	xchg	a,b
	inc	hl
	and	a,[hl]
	xchg	a,b
	pop	hl
	mov	y,ba
	mov	ba,y
	mov	hl,8224
	mov	[hl],a
	mov	hl,8224
	mov	a,[hl]
	ex	ba,a
	mov	x,ba
	mov	hl,64
	mov	ba,x
	push	hl
	mov	hl,sp
	or	a,[hl]
	xchg	a,b
	inc	hl
	or	a,[hl]
	xchg	a,b
	pop	hl
	mov	y,ba
	mov	ba,y
	mov	hl,8224
	mov	[hl],a
vbcc___l191:
	jmp	vbcc___l191
vbcc___l193:
vbcc___l190:
	add	sp,10
	ret
char_font:
	.db	0
	.db	0
	.db	0
	.db	0
	.db	0
	.db	0
	.db	0
	.db	95
	.db	0
	.db	0
	.db	0
	.db	7
	.db	0
	.db	7
	.db	0
	.db	20
	.db	127
	.db	20
	.db	127
	.db	20
	.db	4
	.db	42
	.db	127
	.db	42
	.db	16
	.db	35
	.db	19
	.db	8
	.db	100
	.db	98
	.db	54
	.db	73
	.db	89
	.db	38
	.db	80
	.db	0
	.db	5
	.db	3
	.db	0
	.db	0
	.db	8
	.db	54
	.db	65
	.db	0
	.db	0
	.db	0
	.db	0
	.db	65
	.db	54
	.db	8
	.db	84
	.db	124
	.db	56
	.db	124
	.db	84
	.db	8
	.db	8
	.db	62
	.db	8
	.db	8
	.db	0
	.db	160
	.db	96
	.db	0
	.db	0
	.db	8
	.db	8
	.db	8
	.db	8
	.db	8
	.db	0
	.db	96
	.db	96
	.db	0
	.db	0
	.db	64
	.db	48
	.db	8
	.db	6
	.db	1
	.db	62
	.db	65
	.db	65
	.db	65
	.db	62
	.db	0
	.db	66
	.db	127
	.db	64
	.db	0
	.db	66
	.db	97
	.db	81
	.db	73
	.db	70
	.db	34
	.db	65
	.db	73
	.db	73
	.db	54
	.db	28
	.db	19
	.db	16
	.db	127
	.db	16
	.db	47
	.db	73
	.db	73
	.db	73
	.db	49
	.db	62
	.db	73
	.db	73
	.db	73
	.db	50
	.db	1
	.db	1
	.db	113
	.db	9
	.db	7
	.db	54
	.db	73
	.db	73
	.db	73
	.db	54
	.db	38
	.db	73
	.db	73
	.db	73
	.db	62
	.db	0
	.db	99
	.db	99
	.db	0
	.db	0
	.db	0
	.db	163
	.db	99
	.db	0
	.db	0
	.db	8
	.db	20
	.db	34
	.db	65
	.db	0
	.db	20
	.db	20
	.db	20
	.db	20
	.db	20
	.db	0
	.db	65
	.db	34
	.db	20
	.db	8
	.db	2
	.db	1
	.db	89
	.db	6
	.db	0
	.db	62
	.db	65
	.db	93
	.db	81
	.db	14
	.db	126
	.db	9
	.db	9
	.db	9
	.db	126
	.db	127
	.db	73
	.db	73
	.db	73
	.db	54
	.db	62
	.db	65
	.db	65
	.db	65
	.db	65
	.db	127
	.db	65
	.db	65
	.db	65
	.db	62
	.db	127
	.db	73
	.db	73
	.db	73
	.db	65
	.db	127
	.db	9
	.db	9
	.db	9
	.db	1
	.db	62
	.db	65
	.db	89
	.db	73
	.db	58
	.db	127
	.db	8
	.db	8
	.db	8
	.db	127
	.db	0
	.db	65
	.db	127
	.db	65
	.db	0
	.db	32
	.db	65
	.db	65
	.db	63
	.db	1
	.db	127
	.db	8
	.db	20
	.db	34
	.db	65
	.db	127
	.db	64
	.db	64
	.db	64
	.db	64
	.db	127
	.db	6
	.db	24
	.db	6
	.db	127
	.db	127
	.db	6
	.db	8
	.db	48
	.db	127
	.db	62
	.db	65
	.db	65
	.db	65
	.db	62
	.db	127
	.db	9
	.db	9
	.db	9
	.db	6
	.db	62
	.db	65
	.db	81
	.db	97
	.db	62
	.db	127
	.db	25
	.db	41
	.db	73
	.db	70
	.db	38
	.db	73
	.db	73
	.db	73
	.db	50
	.db	1
	.db	1
	.db	127
	.db	1
	.db	1
	.db	63
	.db	64
	.db	64
	.db	64
	.db	63
	.db	3
	.db	28
	.db	96
	.db	28
	.db	3
	.db	63
	.db	64
	.db	56
	.db	64
	.db	63
	.db	99
	.db	20
	.db	8
	.db	20
	.db	99
	.db	1
	.db	6
	.db	120
	.db	6
	.db	1
	.db	97
	.db	81
	.db	73
	.db	69
	.db	67
	.db	0
	.db	0
	.db	127
	.db	65
	.db	0
	.db	1
	.db	6
	.db	8
	.db	48
	.db	64
	.db	0
	.db	65
	.db	127
	.db	0
	.db	0
	.db	4
	.db	2
	.db	1
	.db	2
	.db	4
	.db	128
	.db	128
	.db	128
	.db	128
	.db	128
	.db	0
	.db	5
	.db	3
	.db	0
	.db	0
	.db	32
	.db	84
	.db	84
	.db	84
	.db	56
	.db	127
	.db	72
	.db	68
	.db	68
	.db	56
	.db	56
	.db	68
	.db	68
	.db	68
	.db	40
	.db	56
	.db	68
	.db	68
	.db	72
	.db	127
	.db	56
	.db	84
	.db	84
	.db	84
	.db	24
	.db	0
	.db	8
	.db	126
	.db	9
	.db	0
	.db	24
	.db	164
	.db	164
	.db	164
	.db	120
	.db	127
	.db	16
	.db	8
	.db	8
	.db	112
	.db	0
	.db	72
	.db	122
	.db	64
	.db	0
	.db	64
	.db	128
	.db	128
	.db	122
	.db	0
	.db	127
	.db	16
	.db	40
	.db	68
	.db	0
	.db	0
	.db	0
	.db	127
	.db	0
	.db	0
	.db	124
	.db	4
	.db	56
	.db	4
	.db	124
	.db	124
	.db	8
	.db	4
	.db	4
	.db	120
	.db	56
	.db	68
	.db	68
	.db	68
	.db	56
	.db	252
	.db	36
	.db	36
	.db	36
	.db	24
	.db	24
	.db	36
	.db	36
	.db	36
	.db	252
	.db	124
	.db	8
	.db	4
	.db	4
	.db	4
	.db	72
	.db	84
	.db	84
	.db	84
	.db	36
	.db	4
	.db	63
	.db	68
	.db	64
	.db	32
	.db	60
	.db	64
	.db	64
	.db	64
	.db	124
	.db	12
	.db	48
	.db	64
	.db	48
	.db	12
	.db	60
	.db	64
	.db	56
	.db	64
	.db	60
	.db	68
	.db	40
	.db	16
	.db	40
	.db	68
	.db	12
	.db	80
	.db	80
	.db	80
	.db	60
	.db	68
	.db	100
	.db	84
	.db	76
	.db	68
	.db	0
	.db	8
	.db	54
	.db	65
	.db	0
	.db	0
	.db	0
	.db	231
	.db	0
	.db	0
	.db	0
	.db	65
	.db	54
	.db	8
	.db	0
	.db	8
	.db	4
	.db	8
	.db	16
	.db	8
	.db	112
	.db	72
	.db	68
	.db	72
	.db	112
	.db	126
	.db	9
	.db	9
	.db	9
	.db	126
	.db	127
	.db	73
	.db	73
	.db	73
	.db	48
	.db	127
	.db	73
	.db	73
	.db	73
	.db	54
	.db	127
	.db	1
	.db	1
	.db	1
	.db	3
	.db	192
	.db	126
	.db	65
	.db	65
	.db	255
	.db	127
	.db	73
	.db	73
	.db	65
	.db	99
	.db	118
	.db	8
	.db	127
	.db	8
	.db	118
	.db	34
	.db	65
	.db	73
	.db	73
	.db	54
	.db	127
	.db	32
	.db	16
	.db	8
	.db	127
	.db	127
	.db	32
	.db	19
	.db	8
	.db	127
	.db	127
	.db	8
	.db	20
	.db	34
	.db	65
	.db	64
	.db	62
	.db	1
	.db	1
	.db	127
	.db	127
	.db	6
	.db	24
	.db	6
	.db	127
	.db	127
	.db	8
	.db	8
	.db	8
	.db	127
	.db	62
	.db	65
	.db	65
	.db	65
	.db	62
	.db	127
	.db	1
	.db	1
	.db	1
	.db	127
	.db	127
	.db	9
	.db	9
	.db	9
	.db	6
	.db	62
	.db	65
	.db	65
	.db	65
	.db	34
	.db	1
	.db	1
	.db	127
	.db	1
	.db	1
	.db	79
	.db	144
	.db	144
	.db	144
	.db	127
	.db	60
	.db	66
	.db	255
	.db	66
	.db	60
	.db	99
	.db	20
	.db	8
	.db	20
	.db	99
	.db	127
	.db	64
	.db	64
	.db	127
	.db	192
	.db	7
	.db	8
	.db	8
	.db	8
	.db	127
	.db	127
	.db	64
	.db	126
	.db	64
	.db	127
	.db	127
	.db	64
	.db	126
	.db	64
	.db	255
	.db	1
	.db	127
	.db	72
	.db	72
	.db	48
	.db	127
	.db	72
	.db	48
	.db	0
	.db	127
	.db	127
	.db	72
	.db	72
	.db	48
	.db	0
	.db	34
	.db	65
	.db	73
	.db	73
	.db	54
	.db	127
	.db	8
	.db	62
	.db	65
	.db	62
	.db	70
	.db	41
	.db	25
	.db	9
	.db	127
	.db	32
	.db	84
	.db	84
	.db	84
	.db	56
	.db	56
	.db	84
	.db	84
	.db	82
	.db	32
	.db	124
	.db	84
	.db	84
	.db	84
	.db	40
	.db	124
	.db	4
	.db	4
	.db	4
	.db	0
	.db	192
	.db	120
	.db	68
	.db	124
	.db	192
	.db	56
	.db	84
	.db	84
	.db	84
	.db	24
	.db	68
	.db	40
	.db	254
	.db	40
	.db	68
	.db	40
	.db	68
	.db	84
	.db	84
	.db	40
	.db	124
	.db	32
	.db	16
	.db	8
	.db	124
	.db	124
	.db	32
	.db	18
	.db	9
	.db	124
	.db	124
	.db	16
	.db	40
	.db	68
	.db	0
	.db	64
	.db	56
	.db	4
	.db	124
	.db	0
	.db	124
	.db	8
	.db	48
	.db	8
	.db	124
	.db	124
	.db	16
	.db	16
	.db	16
	.db	124
	.db	56
	.db	68
	.db	68
	.db	68
	.db	56
	.db	124
	.db	4
	.db	4
	.db	4
	.db	124
	.db	252
	.db	36
	.db	36
	.db	24
	.db	0
	.db	56
	.db	68
	.db	68
	.db	68
	.db	40
	.db	4
	.db	4
	.db	124
	.db	4
	.db	4
	.db	28
	.db	160
	.db	160
	.db	160
	.db	124
	.db	56
	.db	68
	.db	254
	.db	68
	.db	56
	.db	68
	.db	40
	.db	16
	.db	40
	.db	68
	.db	124
	.db	64
	.db	64
	.db	124
	.db	192
	.db	0
	.db	28
	.db	16
	.db	16
	.db	124
	.db	124
	.db	64
	.db	124
	.db	64
	.db	124
	.db	124
	.db	64
	.db	124
	.db	64
	.db	252
	.db	4
	.db	124
	.db	80
	.db	80
	.db	32
	.db	124
	.db	80
	.db	32
	.db	0
	.db	124
	.db	124
	.db	80
	.db	80
	.db	32
	.db	0
	.db	40
	.db	68
	.db	84
	.db	56
	.db	0
	.db	124
	.db	16
	.db	56
	.db	68
	.db	56
	.db	0
	.db	8
	.db	84
	.db	52
	.db	124
	.equ	vbcc___saved_rom_addr .
	.org	5344
	.equ	vbcc___saved_ram_addr .
sy:
	.org	vbcc___saved_ram_addr + 4560
	.dw	0
	.equ	vbcc___saved_rom_shadow .
	.org	vbcc___saved_rom_shadow - 4560
	.equ	vbcc___saved_ram_addr .
sx:
	.org	vbcc___saved_ram_addr + 4560
	.dw	0
	.equ	vbcc___saved_rom_shadow .
	.org	vbcc___saved_rom_shadow - 4560
	.equ	vbcc___saved_ram_addr .
nx:
	.org	vbcc___saved_ram_addr + 4560
	.dw	0
	.equ	vbcc___saved_rom_shadow .
	.org	vbcc___saved_rom_shadow - 4560
	.equ	vbcc___saved_ram_addr .
ny:
	.org	vbcc___saved_ram_addr + 4560
	.dw	1
	.equ	vbcc___saved_rom_shadow .
	.org	vbcc___saved_rom_shadow - 4560
	.equ	vbcc___saved_ram_addr .
markid:
	.org	vbcc___saved_ram_addr + 4560
	.dw	0
	.equ	vbcc___saved_rom_shadow .
	.org	vbcc___saved_rom_shadow - 4560
	.equ	vbcc___saved_ram_addr .
Button_DOWN:
	.org	vbcc___saved_ram_addr + 4560
	.db	0, 0
	.equ	vbcc___saved_rom_shadow .
	.org	vbcc___saved_rom_shadow - 4560
	.equ	vbcc___saved_ram_addr .
	.org	vbcc___saved_rom_addr
vbcc___l63:
	.db	1
	.db	2
	.db	4
	.db	8
	.db	16
	.db	32
	.db	64
	.db	128
vbcc___l89:
	.dw	9
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0
vbcc___l90:
	.db	72	; 'H'
	.db	101	; 'e'
	.db	108	; 'l'
	.db	108	; 'l'
	.db	111	; 'o'
	.db	44	; ','
	.db	32	; ' '
	.db	80	; 'P'
	.db	111	; 'o'
	.db	107	; 'k'
	.db	101	; 'e'
	.db	109	; 'm'
	.db	111	; 'o'
	.db	110	; 'n'
	.db	32	; ' '
	.db	82	; 'R'
	.db	101	; 'e'
	.db	97	; 'a'
	.db	100	; 'd'
	.db	101	; 'e'
	.db	114	; 'r'
	.db	32	; ' '
	.db	109	; 'm'
	.db	105	; 'i'
	.db	110	; 'n'
	.db	105	; 'i'
	.db	33	; '!'
	.db	0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.db	0, 0, 0, 0

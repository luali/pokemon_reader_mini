#include "pm.h"

#include "char_font.h"

#define draw_pixel(x, y) draw_pixel_asm(x, y, mask);
/* Demo how to create ASM inlined code. */
int sy = 0;
int sx = 0;

void draw_pixel_asm(__reg("x") int, __reg("y") int, const short * ) = 
	"\tpush hl\n"\
	"\tmov ba, y\n"\
	"\tand a, 0xf8\n"\
	"\tmov l,12\n"\
	"\tmul l,a\n"\
	"\tadd hl,0x1000\n"\
	"\tadd x,hl\n"\
	"\tmov ba, y\n"\
	"\tand a, 0x07\n"\
	"\tmov b, 0\n"\
	"\tmov hl,[sp+2]\n"\
	"\tadd hl, ba\n"\
	"\tmov a,[hl]\n"\
	"\tmov hl,x\n"\
	"\tor [hl], a\n"\
	"\tpop hl\n";



void print_ch(int x, int y, unsigned char ch)
{
	int i,dy;
	const unsigned short *p2;
	unsigned char *p = (unsigned char *)(0x1000 + (x-sx)%16 * 6 + (y+sy) * 96);
	
	if(ch == 0x40){
		sy++;
		sx = x;
	}
	if(ch < 0x20){
		ch = 0;
	}else{
		ch -= 0x20;
	}
	if(ch>=0xa0){
		ch = 0;
	}
	p2 = char_font[ch];
	for(i = 0; i<5; i++)
		*p++ = *p2++;
	*p++ = 0;
}

void print_digit(int x, int y, int digit)
{
	if(0<=digit && digit <=9)
		digit += '0';
	else if(0xA<=digit && digit <=0xF)
		digit += 'A' - 0xA;
	else
		digit = '?';
		
	print_ch(x, y, digit);
}

void print_dec(char x, char y, int num)
{
	int base;
	if(num < 0)
	{
		print_ch(x, y, '-');
		x += 1;
		num = -num;
	}
	for(base = 10000; base > 1; base /= 10)
		if(num >= base)
			break;
	for(; base >= 1; base /= 10)
	{
		print_digit(x, y, num / base);
		num %= base;
		x += 1;
	}
}

void print_hex(char x, char y, unsigned num)
{
	char i;
	for(i=12; i>=0; i-=4, x+=1)
		print_digit(x, y, (num >>i) & 0x0f);
}

void print_nline(){
	sy++;
}

void print(int x, int y,const char *str)
{
	y = y%8;
	for(; *str; ++str){
		print_ch(x++, y, *str);
	}
}
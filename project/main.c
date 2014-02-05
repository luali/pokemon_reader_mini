//#define SEARCH_START ((const int *)0x21D0)
//#define SEARCH_LIMIT ((const int *)0x8000)

#include "pm.h"
#include "print.h"


static const short mask[] = { 0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80 };

unsigned int nx = 0;
unsigned int ny = 1;

unsigned int markid = 0;

void clear_screen()
{
	int i;
	char *p = (char *)0x1000;
	for(i=0; i<0x300; i++)
		*p++=0;
}

void print_ch2(int x, int y, unsigned char ch)
{
	int i;
	const unsigned short *p2;
	unsigned char *p = (unsigned char *)(0x1000 + x * 6 + y * 96);
		
	if(ch < 0x20)
		ch = 0;
	else
		ch -= 0x20;
	if(ch>=0xa0)
		ch = 0;
	p2 = char_font[ch];
	for(i = 0; i<5; i++)
		*p++ = *p2++;
	
	*p++ = 0;
}

void print_text(int x, int y,const char *str)
{
	int i;
	for(i = 0; i<112; ++str , i++){
		print_ch2(x++, y, *str);
	}
}


//static const int bookmask[102] = {9}; //102 - total count; 101 - total line number;
static const char text[10000] = "Hello, Pokemon Reader mini!"; 

volatile int Button_DOWN;

void __interrupt irq_1_prc_copy()
{
	IRQ_ACT3 = 0x01;
	
	if(!(KEY_PAD & KEY_C)){
		clear_screen();
		ny++;
		//print_hex(3,3,ny);	
		print_text(0,0,text+(ny-1)*16+nx);
		
		print_hex(12,7,ny);	//line
	}
	
	if((!(KEY_PAD & KEY_DOWN)) && !Button_DOWN ){
		clear_screen();
		ny++;
		//print_hex(3,3,Button_DOWN);	
		print_text(0,0,text+(ny-1)*16+nx);
		
		print_hex(12,7,ny);
		Button_DOWN = 1;		
	}else{
		int i;
		if(Button_DOWN)
			for(i = 0;i<2500;i++);
		Button_DOWN = 0;
		//print_hex(3,3,Button_DOWN);	
	}
	
	if((!(KEY_PAD & KEY_UP)) && !Button_DOWN && (ny != 0 && ny != 1)){
		clear_screen();
		ny--;
		//print_hex(3,3,Button_DOWN);	
		print_text(0,0,text+(ny-1)*16+nx);
		
		print_hex(12,7,ny);
		Button_DOWN = 1;			
	}else{
		int i;
		if(Button_DOWN)
			for(i = 0;i<2500;i++);
		Button_DOWN = 0;
		//print_hex(3,3,Button_DOWN);	
	}
	
	if((!(KEY_PAD & KEY_RIGHT)) && !Button_DOWN){
		clear_screen();
		nx++;
		if(nx>16){
			nx = 1;
			ny++;
		}
		//print_hex(3,3,nx);	
		print_text(0,0,text+(ny-1)*16+nx);
		if(ny == 0){
			print_hex(12,7,1);		
		}else{
			print_hex(12,7,ny);
		}		
		print_hex(12,7,ny);
		Button_DOWN = 1;		
	}else{
		int i;
		if(Button_DOWN)
			for(i = 0;i<2500;i++);
		Button_DOWN = 0;
		//print_hex(3,3,nx);	
	}
	
	if((!(KEY_PAD & KEY_LEFT)) && !Button_DOWN && (nx != 0 || ny !=1 ) && ny != 0){
		clear_screen();
		nx--;
		if(!nx){
			nx = 16;
			ny--;
		}
		//print_hex(3,3,nx);	
		print_text(0,0,text+(ny-1)*16+nx);
		if(ny == 0){
			print_hex(12,7,1);
			ny = 1;
			nx = 0;
		}else{
			print_hex(12,7,ny);
		}

		Button_DOWN = 1;		
	}else{
		int i;
		if(Button_DOWN)
			for(i = 0;i<2500;i++);
		Button_DOWN = 0;
		//print_hex(3,3,nx);	
	}
	
}

int main()
{	
	//PRC_RATE = RATE_6FPS;
	int i, a;
	int fsm = 0;
	unsigned long text_len = 0;
	IRQ_PRI2 = 0x0c;
	IRQ_ENA3 = 0x81;
	print_hex(12,7,1);
	print_text(0,0,text);
	//print_hex(0,2,(int)(&q>SEARCH_LIMIT));
	//int dat = find(find);
	/*
	if(&q<SEARCH_LIMIT)
		print(0,0, "Yes");
	else
		print(0,0, "No");
	*/
	//print(0,0, dat);
	//while(fsm){

	
	//}
	IRQ_ENA1 = IRQ1_PRC_COMPLETE;
	PRI_PRC(1);
	while(1);
}


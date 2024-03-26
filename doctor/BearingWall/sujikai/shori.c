/*************************************
  計測チャンネルの説明
  00ch…載荷荷重              kgf
  01ch…桁部の変位            mm
  02ch…土台の変位            mm
  03ch…土台の浮き上がり(左)  mm
  04ch…土台の浮き上がり(右)  mm
  05ch…柱の抜け(左上)        mm
  06ch…柱の抜け(左下)        mm
  07ch…柱の抜け(右上)        mm
  08ch…柱の抜け(右下)        mm
  09ch…筋かいの抜け(上)      mm
  10ch…筋かいの抜け(下)      mm
  11ch…筋かいの伸び(中央)    mm
  12ch…01chの予備(右柱上)    mm
  13ch…02chの予備(右柱下)    mm
  14ch…筋かいの軸力          kgf

  求めるもの
  層間変形角γ                rad
  壁倍率α
  最大荷重 Pmax

  $Id$
  *********************************/
#include <stdio.h>
#include <strings.h>

#define FORMAT "%d,%d,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%d,%d,%d,,,,,,,,,,,,,,,,,,,,,,,,,,,,\n"

float data[13][700];    /* 変位計 13ch, 700個ずつ */
int load[2][700];       /* 荷重計 2ch, 700個ずつ */
char filename[20];
char outname[20];

static void usage()
{
  (void)fprintf(stdout, "Usage: shori datafile\n");
  exit(1);
}

static char *chext(const char *in)
{
  char *tmp = (char*)malloc(sizeof(char*));
  static int i;

  strcpy(tmp, in);

  for ( i = 0 ; ; i++ ){
    if( tmp[i] == '.' ){
#if 0
      printf("%s\t", tmp);
      printf("%d ", i);
#endif
      tmp[i+1] = 'd';
      tmp[i+2] = 'a';
      tmp[i+3] = 't';
      tmp[i+4] = '\0';
      break;
    }
  }

  return tmp;
}
    
int main(int argc, char **argv)
{
  FILE *in, *out;
  char line[256];
  int i;

  if (argc != 2) usage();

  strcpy(filename, argv[1]);
  strcpy(outname, chext(filename));

#if 0
  printf("%s\n", outname);
#endif

  in = fopen(filename,"r");

  /* 1st line is just a label */
  (void)fgets(line, sizeof(line), in);

  
}

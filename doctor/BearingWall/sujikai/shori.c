/*************************************
  ��¬�����ͥ������
  00ch�ĺܲٲٽ�              kgf
  01ch�ķ������Ѱ�            mm
  02ch��������Ѱ�            mm
  03ch��������⤭�夬��(��)  mm
  04ch��������⤭�夬��(��)  mm
  05ch�����ȴ��(����)        mm
  06ch�����ȴ��(����)        mm
  07ch�����ȴ��(����)        mm
  08ch�����ȴ��(����)        mm
  09ch�Ķڤ�����ȴ��(��)      mm
  10ch�Ķڤ�����ȴ��(��)      mm
  11ch�Ķڤ����ο���(���)    mm
  12ch��01ch��ͽ��(�����)    mm
  13ch��02ch��ͽ��(���첼)    mm
  14ch�Ķڤ����μ���          kgf

  ������
  �ش��ѷ��Ѧ�                rad
  ����Ψ��
  ����ٽ� Pmax

  $Id$
  *********************************/
#include <stdio.h>
#include <strings.h>

#define FORMAT "%d,%d,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%d,%d,%d,,,,,,,,,,,,,,,,,,,,,,,,,,,,\n"

float data[13][700];    /* �Ѱ̷� 13ch, 700�Ĥ��� */
int load[2][700];       /* �ٽŷ� 2ch, 700�Ĥ��� */
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

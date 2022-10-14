/*
* util.h
*
* Created: 3/9/2021 7:45:48 PM
*  Author: alexandru.botnaru
*/


#ifndef UTIL_H_
#define UTIL_H_

#define MAX_STR_NUM_SIZE 6

/************************************************************************/
/* Function: str2pos_num                                                */
/* String to positive number                                            */
/* Returns -1 if the string has invalid characters, otherwise the       */
/* converted number.                                                    */
/************************************************************************/
extern short str2pos_num(char *str);

/************************************************************************/
/* Function: num2str                                                    */
/* 16 bit number to string                                              */
/* Converts only unsigned numbers, did not tested unsigned.             */
/*                                                                      */
/************************************************************************/
extern char* num2str(uint16_t value);



#endif /* UTIL_H_ */
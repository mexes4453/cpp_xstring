
#ifndef XSTRING_HPP
# define XSTRING_HPP
#include <iostream>
#include <sstream>
#include <string>
#include <vector>

# define XSTRING__WHITESPACE_CHARS        ("\n\t\v\f\r ")



/**
 * @brief Split strings into substrings using a seperator character.
 * 
 * @param vStr 
 * @param str 
 * @param chr 
 * @return int unsigned 
 */
int unsigned XSTRING__Split(std::vector<std::string> &vStr, std::string &str,
		                                                    char        chr);




/**
 * @brief join multiple strings with a delimiter character between them.
 * 
 * @param vStr 
 * @param str 
 * @param chr 
 * @return 
 */
void  XSTRING__Join(std::vector<std::string> &vStr, std::string &str,
		                                            char        chr);




/**
 * @brief Remove all white spaces in a string.
 * 
 * @param str 
 */
void  XSTRING__RemoveAllWhiteSpace(std::string &str);





/**
 * @brief Remove all leading and trailing whitespace around string.
 * 
 * @param str 
 */
void XSTRING__StripWhiteSpace(std::string &str);

#endif /* XSTRING_HPP */                                    

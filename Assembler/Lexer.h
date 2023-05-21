//
// Created by CoolBassist on 18/01/2023.
//

#ifndef ASSEMBLER_LEXER_H
#define ASSEMBLER_LEXER_H

#include "Token.h"
#include <vector>
#include <string>

class Lexer {
private:
    std::string read_word();
    std::string read_number();
    std::string input;
    void skip_whitespace();
    unsigned int p;

public:
    Lexer(std::string);
    std::vector<Token> get_tokens();
};


#endif //ASSEMBLER_LEXER_H

//
// Created by CoolBassist on 18/01/2023.
//

#ifndef ASSEMBLER_TOKEN_H
#define ASSEMBLER_TOKEN_H

#include <string>

enum TokenType {LABEL, INTEGER, INS, JUMP};

class Token {
private:
    TokenType type;
    std::string value;
public:
    Token(TokenType, std::string);
    TokenType get_type();
    std::string get_value();
};


#endif //ASSEMBLER_TOKEN_H

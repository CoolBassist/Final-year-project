//
// Created by CoolBassist on 18/01/2023.
//

#include "Token.h"

Token::Token(TokenType Toktype, std::string Tokvalue) {
    this->type = Toktype;
    this->value = Tokvalue;
}

TokenType Token::get_type() {
    return this->type;
}

std::string Token::get_value() {
    return this->value;
}

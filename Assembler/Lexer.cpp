//
// Created by CoolBassist on 18/01/2023.
//

#include <sstream>
#include <utility>
#include "Lexer.h"

Lexer::Lexer(std::string string) {
    this->input = std::move(string);
    this->p = 0;
}

std::vector<Token> Lexer::get_tokens() {
    std::vector<Token> tokens;
    skip_whitespace();
    while(p < input.size()){
        //comments are denoted with `%`.
        if(input[p] == '%'){
            do{
                p++;
            }while(input[p] != '\n');

            p++;
            continue;
        }

        std::string current_word = read_word();
        if(current_word == "LDIA"){
            tokens.emplace_back(INS, "LDIA");
        }else if(current_word == "LDA"){
            tokens.emplace_back(INS, "LDA");
        }else if(current_word == "STA"){
            tokens.emplace_back(INS, "STA");
        }else if(current_word == "LASP"){
            tokens.emplace_back(INS, "LASP");
        }else if(current_word == "STASP"){
            tokens.emplace_back(INS, "STASP");
        }else if(current_word == "LDIB"){
            tokens.emplace_back(INS, "LDIB");
        }else if(current_word == "LDB"){
            tokens.emplace_back(INS, "LDB");
        }else if(current_word == "STB"){
            tokens.emplace_back(INS, "STB");
        }else if(current_word == "IBIC"){
            tokens.emplace_back(INS, "IBIC");
        }else if(current_word == "ADD"){
            tokens.emplace_back(INS, "ADD");
        }else if(current_word == "SUB"){
            tokens.emplace_back(INS, "SUB");
        }else if(current_word == "MUL"){
            tokens.emplace_back(INS, "MUL");
        }else if(current_word == "DIV"){
            tokens.emplace_back(INS, "DIV");
        }else if(current_word == "MOD"){
            tokens.emplace_back(INS, "MOD");
        }else if(current_word == "JMP"){
            tokens.emplace_back(INS, "JMP");
        }else if(current_word == "JLT"){
            tokens.emplace_back(INS, "JLT");
        }else if(current_word == "JEQ"){
            tokens.emplace_back(INS, "JEQ");
        }else if(current_word == "JGT"){
            tokens.emplace_back(INS, "JGT");
        }else if(current_word == "JLE"){
            tokens.emplace_back(INS, "JLE");
        }else if(current_word == "JGE"){
            tokens.emplace_back(INS, "JGE");
        }else if(current_word == "JNE"){
            tokens.emplace_back(INS, "JNE");
        }else if(current_word == "LSP"){
            tokens.emplace_back(INS, "LSP");
        }else if(current_word == "OUTI"){
            tokens.emplace_back(INS, "OUTI");
        }else if(current_word == "OUTC"){
            tokens.emplace_back(INS, "OUTC");
        }else if(current_word == "INA"){
            tokens.emplace_back(INS, "INA");
        }else if(current_word == "INB"){
            tokens.emplace_back(INS, "INB");
        }else if(current_word == "HALT"){
            tokens.emplace_back(INS, "HALT");
        }else{
            if(!current_word.empty() && current_word.back() == ':'){
                current_word.pop_back();
                tokens.emplace_back(LABEL, current_word);
            }else if(!current_word.empty()){
                tokens.emplace_back(JUMP, current_word);
            }else{
                std::string number = read_number();
                if(!number.empty()) {
                    tokens.emplace_back(INTEGER, number);
                }
            }
        }

        p++;
    }

    return tokens;
}

std::string Lexer::read_word() {
    std::string word;
    if(isdigit(input[p])){
        return "";
    }
    while(p < input.size() && input[p] != '\n' && input[p] != ' ' && input[p] != '\t'){
        word += input[p];
        p++;
    }

    return word;
}

void Lexer::skip_whitespace() {
    while(input[p] == '\n' || input[p] == ' ' || input[p] == '\t'){
        p++;
    }
}

std::string Lexer::read_number() {
    std::string number;
    while(p < input.size() && input[p] != '\n' && input[p] != ' ' && input[p] != '\t' && isdigit(input[p])){
        number += input[p];
        p++;
    }

    int full_number;

    try{
        full_number = std::stoi(number);
    }catch (std::exception &e){
        return "";
    }

    std::stringstream ss;
    ss<< std::hex << full_number; // int decimal_value

    return ss.str();
}



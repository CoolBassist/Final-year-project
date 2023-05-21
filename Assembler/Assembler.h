//
// Created by CoolBassist on 18/01/2023.
//

#ifndef ASSEMBLER_ASSEMBLER_H
#define ASSEMBLER_ASSEMBLER_H


#include <vector>
#include "Token.h"

class Assembler {
private:
    std::vector<Token> input;
    std::vector<std::pair<std::string, std::string>> instructions;
    std::vector<std::pair<std::string, std::string>> labels;
    std::vector<std::string> errors;
    unsigned int p;
    int instruction_number;
public:
    Assembler(std::vector<Token>);
    void assemble();
    std::vector<std::pair<std::string, std::string>> get_instructions();
    std::string get_assembly();
    std::vector<std::pair<std::string, std::string>> get_labels(); // TODO: delete this. Purely for debugging purposes.
    std::vector<std::string> get_errors();

};


#endif //ASSEMBLER_ASSEMBLER_H

//
// Created by CoolBassist on 18/01/2023.
//

#include <utility>
#include <sstream>
#include <iostream>
#include "Assembler.h"

Assembler::Assembler(std::vector<Token> tokens) {
    this->input = std::move(tokens);
    this->p = 0;
    this->instruction_number = 0;
}

void Assembler::assemble() {
    for(Token t: input){
        // 0: LABEL     1: INTEGER     2: INS      3: JUMP
        // First pass: Setting up the label locations.
        int full_number = instruction_number;
        std::stringstream ss;
        switch(t.get_type()){
            case 0:
                int first_half;
                int second_half;
                first_half = full_number & (0xFF);
                second_half = full_number >> 8;
                ss<< std::hex << first_half << "\n" << second_half;
                this->labels.emplace_back(t.get_value(), ss.str());
                break;
            case 1:
            case 2: instruction_number++; break;
            case 3: instruction_number+=2; break;
        }
    }

    while(p <= input.size()){
        // 0: LABEL     1: INTEGER     2: INS      3: JUMP
        // Second pass: creating the pairs.
        switch(input[p].get_type()) {
            case 1:
                errors.emplace_back("Error! Stray Integer!\n"); break;
            case 2:
                if (input[p].get_value() == "LDIA") {
                    if(input[p+1].get_type() != INTEGER){
                        errors.emplace_back("Immediate value for LDIA must be an integer!\n");
                    }
                    instructions.emplace_back("10", input[p + 1].get_value());
                    p += 2;
                } else if (input[p].get_value() == "LDA") {
                    if(input[p+1].get_type() != INTEGER){
                        errors.emplace_back("Immediate value for LDA must be an integer!\n");
                    }
                    instructions.emplace_back("11", input[p + 1].get_value() + " " + input[p + 2].get_value());
                    p += 3;
                } else if (input[p].get_value() == "STA") {
                    if(input[p+1].get_type() != INTEGER){
                        errors.emplace_back("Immediate value for STA must be an integer!\n");
                    }
                    instructions.emplace_back("12", input[p + 1].get_value() + " " + input[p + 2].get_value());
                    p += 3;
                } else if (input[p].get_value() == "LDIB") {
                    if(input[p+1].get_type() != INTEGER){
                        errors.emplace_back("Immediate value for LDIB must be an integer!\n");
                    }
                    instructions.emplace_back("20", input[p + 1].get_value());
                    p += 2;
                } else if (input[p].get_value() == "LDB") {
                    if(input[p+1].get_type() != INTEGER){
                        errors.emplace_back("Immediate value for LDB must be an integer!\n");
                    }
                    instructions.emplace_back("21", input[p + 1].get_value() + " " + input[p + 2].get_value());
                    p += 3;
                } else if (input[p].get_value() == "STB") {
                    if(input[p+1].get_type() != INTEGER){
                        errors.emplace_back("Immediate value for STB must be an integer!\n");
                        return;
                    }
                    instructions.emplace_back("22", input[p + 1].get_value() + " " + input[p + 2].get_value());
                    p += 3;
                } else if (input[p].get_value() == "IBIC") {
                    instructions.emplace_back("23", "");
                    p++;
                } else if (input[p].get_value() == "LASP") {
                    instructions.emplace_back("13", "");
                    p++;
                } else if (input[p].get_value() == "STASP") {
                    instructions.emplace_back("14", "");
                    p++;
                } else if (input[p].get_value() == "ADD") {
                    instructions.emplace_back("30", "");
                    p++;
                } else if (input[p].get_value() == "SUB") {
                    instructions.emplace_back("31", "");
                    p++;
                } else if (input[p].get_value() == "MUL") {
                    instructions.emplace_back("32", "");
                    p++;
                } else if (input[p].get_value() == "DIV") {
                    instructions.emplace_back("33", "");
                    p++;
                } else if (input[p].get_value() == "MOD") {
                    instructions.emplace_back("34", "");
                    p++;
                } else if (input[p].get_value() == "JMP") {
                    if(input[p+1].get_type() != JUMP){
                        errors.emplace_back("Jump argument must be a label!\n");
                    }

                    std::string k = "-1";

                    for(const std::pair<std::string, std::string>& label: labels){
                        if(label.first == input[p+1].get_value()){
                            k = label.second;
                        }
                    }

                    if(k == "-1"){
                        errors.emplace_back("No matching label found for jump `" + input[p+1].get_value() + "!\n");
                    }

                    instructions.emplace_back("40", k);
                    p += 2;
                } else if (input[p].get_value() == "JLT") {
                    if(input[p+1].get_type() != JUMP){
                        errors.emplace_back("Jump argument must be a label!\n");
                        return;
                    }

                    std::string k = "-1";

                    for(const std::pair<std::string, std::string>& label: labels){
                        if(label.first == input[p+1].get_value()){
                            k = label.second;
                        }
                    }

                    if(k == "-1"){
                        errors.emplace_back("No matching label found for jump `" + input[p+1].get_value() + "!\n");
                    }
                    instructions.emplace_back("41", k);
                    p += 2;
                } else if (input[p].get_value() == "JEQ") {
                    if(input[p+1].get_type() != JUMP){
                        errors.emplace_back("Jump argument must be a label!\n");
                        return;
                    }

                    std::string k = "-1";

                    for(const std::pair<std::string, std::string>& label: labels){
                        if(label.first == input[p+1].get_value()){
                            k = label.second;
                        }
                    }

                    if(k == "-1"){
                        errors.emplace_back("No matching label found for jump `" + input[p+1].get_value() + "!\n");
                    }
                    instructions.emplace_back("42", k);
                    p += 2;
                } else if (input[p].get_value() == "JGT") {
                    if(input[p+1].get_type() != JUMP){
                        errors.emplace_back("Jump argument must be a label!\n");
                    }

                    std::string k = "-1";

                    for(const std::pair<std::string, std::string>& label: labels){
                        if(label.first == input[p+1].get_value()){
                            k = label.second;
                        }
                    }

                    if(k == "-1"){
                        errors.emplace_back("No matching label found for jump `" + input[p+1].get_value() + "!\n");
                    }
                    instructions.emplace_back("43", k);
                    p += 2;
                } else if (input[p].get_value() == "JLE") {
                    if(input[p+1].get_type() != JUMP){
                        errors.emplace_back("Jump argument must be a label!\n");
                    }

                    std::string k = "-1";

                    for(const std::pair<std::string, std::string>& label: labels){
                        if(label.first == input[p+1].get_value()){
                            k = label.second;
                        }
                    }

                    if(k == "-1"){
                        errors.emplace_back("No matching label found for jump `" + input[p+1].get_value() + "!\n");
                    }
                    instructions.emplace_back("44", k);
                    p += 2;
                }else if (input[p].get_value() == "JGE") {
                    if(input[p+1].get_type() != JUMP){
                        errors.emplace_back("Jump argument must be a label!\n");
                    }

                    std::string k = "-1";

                    for(const std::pair<std::string, std::string>& label: labels){
                        if(label.first == input[p+1].get_value()){
                            k = label.second;
                        }
                    }

                    if(k == "-1"){
                        errors.emplace_back("No matching label found for jump `" + input[p+1].get_value() + "!\n");
                    }
                    instructions.emplace_back("45", k);
                    p += 2;
                } else if (input[p].get_value() == "JNE") {
                    if(input[p+1].get_type() != JUMP){
                        errors.emplace_back("Jump argument must be a label!\n");
                    }

                    std::string k = "-1";

                    for(const std::pair<std::string, std::string>& label: labels){
                        if(label.first == input[p+1].get_value()){
                            k = label.second;
                        }
                    }

                    if(k == "-1"){
                        errors.emplace_back("No matching label found for jump `" + input[p+1].get_value() + "!\n");
                    }
                    instructions.emplace_back("46", k);
                    p += 2;
                } else if (input[p].get_value() == "LSP") {
                    instructions.emplace_back("50", "");
                    p++;
                } else if (input[p].get_value() == "OUTI") {
                    instructions.emplace_back("E0", "");
                    p++;
                } else if (input[p].get_value() == "OUTC") {
                    instructions.emplace_back("E1", "");
                    p++;
                } else if (input[p].get_value() == "INA") {
                    instructions.emplace_back("EA", "");
                    p++;
                } else if (input[p].get_value() == "INB") {
                    instructions.emplace_back("EB", "");
                    p++;
                } else if (input[p].get_value() == "HALT") {
                    instructions.emplace_back("FF", "");
                    p++;
                }else{
                    std::cout << "Unknown: " << input[p].get_value() << "\n";
                }
                break;

            case 3:
                errors.emplace_back("Error! Stray jump!\n"); break;
            default:
                p++;
        }
    }
}

std::vector<std::pair<std::string, std::string>> Assembler::get_instructions() {
    return this->instructions;
}

std::vector<std::pair<std::string, std::string>> Assembler::get_labels() {
    return this->labels;
}

std::string Assembler::get_assembly() {
    std::string s;
    for(const std::pair<std::string, std::string>& ins: this->instructions){
        s += ins.first;
        s += "\n";
        if(!ins.second.empty()) {
            s += ins.second;
            s += "\n";
        }
    }

    return s;
}

std::vector<std::string> Assembler::get_errors() {
    return this->errors;
}

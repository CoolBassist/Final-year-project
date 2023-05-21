#include <iostream>

#include <fstream>
#include "Lexer.h"
#include "Assembler.h"

void test(const std::string&);

int main(int argc, char** argv) {
    std::ifstream infile;

    infile.open(argv[1]);

    std::string input;

    if(infile.is_open()){
        std::string s;
        while(getline(infile, s)){ //read data from file object and put it into string.
            input += s + "\n"; //print the data of the string
        }
        infile.close(); //close the file object.
    }else{
        std::cout << "FATAL: error reading file.";
        return 0;
    }

    //test("LDIA 1\nSTA 255\nloop:\nLDIA 1\nSTA 0\nLDA 255\nLDB 0\nADD\nSTA 255\nLDA 255\nSTA 0\nLDIA 10\nSTA 1\nLDA 0\nLDB 1\nJLT loop");

    Lexer lexer(input);
    std::vector<Token> tokens = lexer.get_tokens();

    Assembler assembler(tokens);
    assembler.assemble();

    std::string code = assembler.get_assembly();

    for(std::string error: assembler.get_errors()){
        std::cout << error << "\n";
    }

    if(assembler.get_errors().size() == 0){
        std::cout << "Program assembled successfully.\n";
    }else{
        return 0; // return error if there are errors.
    }

    std::ofstream outfile(argv[2]);

    outfile << "v2.0 raw\n";

    outfile << code;

    std::cout << "Wrote output to " << argv[2] << std::endl;

    return 0;
}

void test(const std::string& input){
    Lexer lexer(input);

    std::cout << "---INPUT---" << std::endl;
    std::cout << input << std::endl;

    std::vector<Token> tokens = lexer.get_tokens();
    std::string types[] {"Label\t\t", "Integer\t\t", "Instruction\t", "Jump\t\t"};

    std::cout << "---TOKENS---" << std::endl;
    for(Token token: tokens){
        std::cout << types[token.get_type()] << ": `" << token.get_value() << "`\n";
    }

    Assembler assembler(tokens);

    std::cout << "%GETTING INSTRUCTIONS%" << std::endl;
    assembler.assemble();
    std::cout << "%GOT INSTRUCTIONS%" << std::endl;


    std::vector<std::pair<std::string, std::string>> ins = assembler.get_instructions();
    std::vector<std::pair<std::string, std::string>> labels = assembler.get_labels();

    std::cout << "---LABELS---" << std::endl;
    for(const std::pair<std::string, std::string>& label: labels){
        std::cout << label.first << ": " << label.second << "\n";
    }

    std::cout << "---INSTRUCTIONS---" << std::endl;
    for(const std::pair<std::string, std::string>& inst: ins){
        std::cout << inst.first << " " << inst.second << "\n";
    }

    std::cout << "---CODE---" << std::endl;

    std::string code = assembler.get_assembly();

    std::cout << code << std::endl;

    std::cout << "\n\nend.";
}
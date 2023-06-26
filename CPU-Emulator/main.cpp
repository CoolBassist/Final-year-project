#include <iostream>
#include <fstream>
#include <vector>
#include <sstream>
#include <algorithm>
#include <string>
#include "CPU.h"

uint8_t convert_int(std::string);
void print_integer(uint8_t);

int main(int argc, char **argv)
{
    std::ifstream infile;

    infile.open(argv[1]);

    bool debug = false;
    int memory_view = 10;

    if (argc > 2)
    {
        debug = true;
        memory_view = atoi(argv[2]);
    }

    std::vector<std::string> raw_lines;

    if (infile.is_open())
    {
        std::string s;
        while (getline(infile, s))
        {
            std::transform(s.begin(), s.end(), s.begin(), ::toupper);
            raw_lines.emplace_back(s);
        }
        infile.close(); // close the file object.
    }
    else
    {
        std::cout << "FATAL: error reading file.";
        return 0;
    }

    raw_lines.erase(raw_lines.begin());

    std::vector<std::string> instructions;

    for (std::string s : raw_lines)
    {
        if (s.size() <= 2)
        {
            instructions.emplace_back(s);
        }
        else
        {
            std::stringstream ss(s);
            std::string s1, s2;
            ss >> s1;
            ss >> s2;

            instructions.emplace_back(s1);
            instructions.emplace_back(s2);
        }
    }

    if (debug)
    {
        std::cout << "INSTRUCTIONS:\n";
        for (std::string s : instructions)
            std::cout << s << std::endl;
    }

    if (debug)
    {
        std::cout << "SIZE OF INSTRUCTIONS: " << instructions.size() << std::endl;
        std::cout << "EXECUTING PROGRAM.." << std::endl;
    }

    CPU cpu;

    while (instructions[cpu.get_PC()] != "FF")
    {
        std::string current_instruction = instructions[cpu.get_PC()];

        if (debug)
        {
            std::cout << "CURRENT_INS: " << current_instruction << std::endl;
            std::cout << "A register: " << cpu.get_A_register() / 1 << "\nB register: " << cpu.get_B_register() / 1
                      << std::endl;
        }

        switch (std::stoi(current_instruction))
        {
        case 00:
            // do nothing
            break;
        case 10:
            cpu.increment_pc();
            uint8_t arg1 = convert_int(instructions[cpu.get_PC()]);
            if (debug)
                std::cout << "ARGUMENT 1: " << arg1 / 1;
            cpu.set_A_register(arg1);
            break;
        case 11:
            cpu.increment_pc();
            uint8_t val1 = convert_int(instructions[cpu.get_PC()]);
            cpu.increment_pc();
            uint8_t val2 = convert_int(instructions[cpu.get_PC()]);

            if (debug)
                std::cout << "ARGUMENT 1: " << val1 / 1 << "\nARGUMENT 2: " << val2 / 1;
            cpu.set_A_register(cpu.get_ram((val2 << 8) ^ val1));
            break;
        case 12:
            cpu.increment_pc();
            uint8_t val1 = convert_int(instructions[cpu.get_PC()]);
            cpu.increment_pc();
            uint8_t val2 = convert_int(instructions[cpu.get_PC()]);

            if (debug)
                std::cout << "ARGUMENT 1: " << val1 / 1 << "\nARGUMENT 2: " << val2 / 1;

            cpu.set_ram((val2 << 8) ^ val1, cpu.get_A_register());
            break;
        case 13:
            cpu.set_A_register(cpu.get_ram(cpu.get_sp()));
            break;
        case 14:
            cpu.set_ram(cpu.get_sp(), cpu.get_A_register());
            break;
        case 20:
            cpu.increment_pc();
            cpu.set_B_register(convert_int(instructions[cpu.get_PC()]));
            break;
        case 21:
            cpu.increment_pc();
            uint8_t val1 = convert_int(instructions[cpu.get_PC()]);
            cpu.increment_pc();
            uint8_t val2 = convert_int(instructions[cpu.get_PC()]);

            if (debug)
                std::cout << "ARGUMENT 1: " << val1 / 1 << "\nARGUMENT 2: " << val2 / 1;

            cpu.set_B_register(cpu.get_ram((val2 << 8) ^ val1));
            break;
        case 22:
            cpu.increment_pc();
            uint8_t val1 = convert_int(instructions[cpu.get_PC()]);
            cpu.increment_pc();
            uint8_t val2 = convert_int(instructions[cpu.get_PC()]);

            if (debug)
                std::cout << "ARGUMENT 1: " << val1 / 1 << "\nARGUMENT 2: " << val2 / 1;

            cpu.set_ram((val2 << 8) ^ val1, cpu.get_B_register());
            break;
        case 30:
            cpu.set_A_register(cpu.get_A_register() + cpu.get_B_register());
            break;
        case 31:
            cpu.set_A_register(cpu.get_A_register() - cpu.get_B_register());
            break;
        case 32:
            cpu.set_A_register(cpu.get_A_register() * cpu.get_B_register());
            break;
        case 33:
            cpu.set_A_register(cpu.get_A_register() / cpu.get_B_register());
            break;
        case 34:
            cpu.set_A_register(cpu.get_A_register() % cpu.get_B_register());
            break;
        case 40:
            cpu.increment_pc();
            uint8_t val1 = convert_int(instructions[cpu.get_PC()]);
            cpu.increment_pc();
            uint8_t val2 = convert_int(instructions[cpu.get_PC()]);

            if (debug)
                std::cout << "ARGUMENT 1: " << val1 / 1 << "\nARGUMENT 2: " << val2 / 1 << std::endl
                          << std::endl;

            cpu.set_PC((val2 << 8) ^ val1);
            continue;
            break;
        case 41:
            cpu.increment_pc();
            uint8_t val1 = convert_int(instructions[cpu.get_PC()]);
            cpu.increment_pc();
            uint8_t val2 = convert_int(instructions[cpu.get_PC()]);

            if (debug)
                std::cout << "ARGUMENT 1: " << val1 / 1 << "\nARGUMENT 2: " << val2 / 1 << std::endl
                          << std::endl;

            if (cpu.get_A_register() < cpu.get_B_register())
            {
                cpu.set_PC((val2 << 8) ^ val1);
                continue;
            }
            break;
        case 42:
            cpu.increment_pc();
            uint8_t val1 = convert_int(instructions[cpu.get_PC()]);
            cpu.increment_pc();
            uint8_t val2 = convert_int(instructions[cpu.get_PC()]);

            if (debug)
                std::cout << "ARGUMENT 1: " << val1 / 1 << "\nARGUMENT 2: " << val2 / 1 << std::endl
                          << std::endl;

            if (cpu.get_A_register() == cpu.get_B_register())
            {
                cpu.set_PC((val2 << 8) ^ val1);
                continue;
            }
            break;
        case 43:
            cpu.increment_pc();
            uint8_t val1 = convert_int(instructions[cpu.get_PC()]);
            cpu.increment_pc();
            uint8_t val2 = convert_int(instructions[cpu.get_PC()]);

            if (debug)
                std::cout << "ARGUMENT 1: " << val1 / 1 << "\nARGUMENT 2: " << val2 / 1 << std::endl
                          << std::endl;

            if (cpu.get_A_register() > cpu.get_B_register())
            {
                cpu.set_PC((val2 << 8) ^ val1);
                continue;
            }
            break;
        case 44:
            cpu.increment_pc();
            uint8_t val1 = convert_int(instructions[cpu.get_PC()]);
            cpu.increment_pc();
            uint8_t val2 = convert_int(instructions[cpu.get_PC()]);

            if (debug)
                std::cout << "ARGUMENT 1: " << val1 / 1 << "\nARGUMENT 2: " << val2 / 1 << std::endl
                          << std::endl;

            if (cpu.get_A_register() <= cpu.get_B_register())
            {
                cpu.set_PC((val2 << 8) ^ val1);
                continue;
            }
            break;
        case 45:
            cpu.increment_pc();
            uint8_t val1 = convert_int(instructions[cpu.get_PC()]);
            cpu.increment_pc();
            uint8_t val2 = convert_int(instructions[cpu.get_PC()]);

            if (debug)
                std::cout << "ARGUMENT 1: " << val1 / 1 << "\nARGUMENT 2: " << val2 / 1 << std::endl
                          << std::endl;

            if (cpu.get_A_register() >= cpu.get_B_register())
            {
                cpu.set_PC((val2 << 8) ^ val1);
                continue;
            }
            break;
        case 46:
            cpu.increment_pc();
            uint8_t val1 = convert_int(instructions[cpu.get_PC()]);
            cpu.increment_pc();
            uint8_t val2 = convert_int(instructions[cpu.get_PC()]);

            if (debug)
                std::cout << "ARGUMENT 1: " << val1 / 1 << "\nARGUMENT 2: " << val2 / 1 << std::endl
                          << std::endl;

            if (cpu.get_A_register() != cpu.get_B_register())
            {
                cpu.set_PC((val2 << 8) ^ val1);
                continue;
            }
            break;
        case 50:
            cpu.set_sp();
            break;
        }
        if (current_instruction == "E0")
        {
            print_integer(cpu.get_A_register());
        }
        else if (current_instruction == "E1")
        {
            break;
        }
        else if (current_instruction == "EA")
        {
            int t;
            std::cout << ">>> ";
            std::cin >> t;

            cpu.set_A_register(t);
        }
        else if (current_instruction == "EB")
        {
            int t;
            std::cout << ">>> ";
            std::cin >> t;

            cpu.set_B_register(t);
            break;
        }
        else
        {
            std::cout << "unkown instruction "
                      << "\n";
        }
    }

    cpu.increment_pc();

    if (debug)
        std::cout << std::endl
                  << std::endl;
    if (debug)
        std::cout << "\n\nPROGRAM FINISHED\nA register: " << (int)cpu.get_A_register() << "\nB register: " << (int)cpu.get_B_register() << std::endl;

    if (debug)
        for (int i = 0; i < memory_view; i++)
            std::cout << "Memory Location " << i << ": " << cpu.get_ram(i) / 1 << "\n";

    if (debug)
        std::cout << "...\n";

    if (debug)
        for (int i = (65535 - memory_view); i <= 65535; i++)
            std::cout << "Memory Location " << i << ": " << cpu.get_ram(i) / 1 << "\n";

    return 0;
}

uint8_t convert_int(std::string s)
{
    int i;
    std::stringstream ss;
    ss << std::hex << s;
    ss >> i;

    return i;
}

void print_integer(uint8_t v)
{
    std::cout << v / 100;
    v %= 100;
    std::cout << v / 10;
    v %= 10;
    std::cout << v / 1;
}

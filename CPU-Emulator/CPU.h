//
// Created by CoolBassist on 21/05/2023.
//

#ifndef CPUEMULATOR_CPU_H
#define CPUEMULATOR_CPU_H


#include <cstdint>
#include <vector>

class CPU {
private:
    std::vector<uint8_t> instructions;
    uint8_t ram[65536] {0};

    uint8_t a_register;
    uint8_t b_register;

    uint16_t sp;
    uint16_t pc;

public:
    CPU();
    void set_A_register(uint8_t);
    void set_B_register(uint8_t);
    void set_sp();
    void set_PC(uint16_t);

    void increment_pc();

    uint8_t get_A_register() const;
    uint8_t get_B_register() const;
    uint16_t get_sp() const;
    uint16_t get_PC() const;

    void set_ram(uint16_t, uint8_t);
    uint8_t get_ram(uint16_t);
};


#endif //CPUEMULATOR_CPU_H

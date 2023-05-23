//
// Created by CoolBassist on 21/05/2023.
//

#include "CPU.h"

CPU::CPU() {
    this->a_register = 0;
    this->b_register = 0;
    this->pc = 0;
    this->sp = 0;
}

void CPU::set_A_register(uint8_t v) {
    this->a_register = v;
}

void CPU::set_B_register(uint8_t v) {
    this->b_register = v;
}

void CPU::set_PC(uint16_t v) {
    this->pc = v;
}

void CPU::increment_pc() {
    this->pc++;
}

uint8_t CPU::get_A_register() const {
    return this->a_register;
}

uint8_t CPU::get_B_register() const {
    return this->b_register;
}

uint16_t CPU::get_PC() const {
    return this->pc;
}

void CPU::set_sp() {
    this->sp = (this->a_register << 8) ^ (this->b_register);
}

uint16_t CPU::get_sp() const {
    return this->sp;
}

void CPU::set_ram(uint16_t a, uint8_t v) {
    this->ram[a] = v;
}

uint8_t CPU::get_ram(uint16_t a) {
    return this->ram[a];
}


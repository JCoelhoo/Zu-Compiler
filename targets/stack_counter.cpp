// $Id: stack_counter.cpp,v 1.3 2016/05/19 14:51:53 ist177983 Exp $ -*- c++ -*-
#include <string>
#include "targets/stack_counter.h"
#include "ast/all.h"  // automatically generated
#include <vector>
#include <algorithm>

//---------------------------------------------------------------------------

size_t zu::stack_counter::getCounter(){
  return counter;
}

void zu::stack_counter::do_integer_node(cdk::integer_node * const node, int lvl) {
}

void zu::stack_counter::do_double_node(cdk::double_node * const node, int lvl) {
}

void zu::stack_counter::do_string_node(cdk::string_node * const node, int lvl) {
}

//---------------------------------------------------------------------------

inline void zu::stack_counter::processUnaryExpression(cdk::unary_expression_node * const node, int lvl) {
}

void zu::stack_counter::do_neg_node(cdk::neg_node * const node, int lvl) {
}

//---------------------------------------------------------------------------


inline void zu::stack_counter::processBinaryExpressionIntDouble(cdk::binary_expression_node * const node, int lvl) {
}

inline void zu::stack_counter::processBinaryExpressionAdd(cdk::binary_expression_node * const node, int lvl) {
}
inline void zu::stack_counter::processBinaryExpressionSub(cdk::binary_expression_node * const node, int lvl) {
}

inline void zu::stack_counter::processBinaryExpressionInt(cdk::binary_expression_node * const node, int lvl) {
}


void zu::stack_counter::do_add_node(cdk::add_node * const node, int lvl) {
}
void zu::stack_counter::do_sub_node(cdk::sub_node * const node, int lvl) {
}
void zu::stack_counter::do_mul_node(cdk::mul_node * const node, int lvl) {
}
void zu::stack_counter::do_div_node(cdk::div_node * const node, int lvl) {
}
void zu::stack_counter::do_mod_node(cdk::mod_node * const node, int lvl) {
}
void zu::stack_counter::do_lt_node(cdk::lt_node * const node, int lvl) {
}
void zu::stack_counter::do_le_node(cdk::le_node * const node, int lvl) {
}
void zu::stack_counter::do_ge_node(cdk::ge_node * const node, int lvl) {
}
void zu::stack_counter::do_gt_node(cdk::gt_node * const node, int lvl) {
}
void zu::stack_counter::do_ne_node(cdk::ne_node * const node, int lvl) {
}
void zu::stack_counter::do_eq_node(cdk::eq_node * const node, int lvl) {
}

//---------------------------------------------------------------------------

void zu::stack_counter::do_rvalue_node(zu::rvalue_node * const node, int lvl) {
}

//---------------------------------------------------------------------------

void zu::stack_counter::do_assignment_node(zu::assignment_node * const node, int lvl) {
}

//---------------------------------------------------------------------------

void zu::stack_counter::do_evaluation_node(zu::evaluation_node * const node, int lvl) {
}

void zu::stack_counter::do_print_node(zu::print_node * const node, int lvl) {
}

//---------------------------------------------------------------------------

void zu::stack_counter::do_read_node(zu::read_node * const node, int lvl) {
}

//---------------------------------------------------------------------------
void zu::stack_counter::do_for_node(zu::for_node * const node, int lvl) {
  node->init()->accept(this, 0);
  node->block()->accept(this, 0);
}

void zu::stack_counter::do_and_node(zu::and_node * const node, int lvl) {
}

void zu::stack_counter::do_or_node(zu::or_node * const node, int lvl) {
}

void zu::stack_counter::do_not_node(zu::not_node * const node, int lvl) {
}


void zu::stack_counter::do_ret_node(zu::ret_node * const node, int lvl) {}

void zu::stack_counter::do_cont_node(zu::cont_node * const node, int lvl) {}

void zu::stack_counter::do_break_node(zu::break_node * const node, int lvl) {}

void zu::stack_counter::do_function_impl_node(zu::function_impl_node * const node, int lvl) {
}

void zu::stack_counter::do_function_call_node(zu::function_call_node * const node, int lvl) {
}

void zu::stack_counter::do_function_dec_node(zu::function_dec_node * const node, int lvl) {
}


void zu::stack_counter::do_identifier_node(zu::identifier_node * const node, int lvl) {
}


void zu::stack_counter::do_declaration_node(zu::declaration_node * const node, int lvl) {
  counter +=node->type()->size();
}

void zu::stack_counter::do_identity_node(zu::identity_node * const node, int lvl) {
}

void zu::stack_counter::do_malloc_node(zu::malloc_node * const node, int lvl) {
}

void zu::stack_counter::do_address_node(zu::address_node * const node, int lvl) {
}

void zu::stack_counter::do_index_node(zu::index_node * const node, int lvl) {
}

void zu::stack_counter::do_block_node(zu::block_node * const node, int lvl) {
  if (node->declarationBlock() != nullptr) node->declarationBlock()->accept(this, 0);
  if (node->instructionBlock() != nullptr) node->instructionBlock()->accept(this, 0);
}


//---------------------------------------------------------------------------

void zu::stack_counter::do_if_node(zu::if_node * const node, int lvl) {
  node->block()->accept(this, 0);
}

void zu::stack_counter::do_if_else_node(zu::if_else_node * const node, int lvl) {
  node->thenblock()->accept(this, 0);
  node->elseblock()->accept(this, 0);
}

void zu::stack_counter::do_sequence_node(cdk::sequence_node * const node, int lvl) {
  for (size_t i = 0; i <  node->nodes().size(); i++){
    node->node(i)->accept(this, 0);
  }
}

void zu::stack_counter::do_lvalue_node(zu::lvalue_node * const node, int lvl){}


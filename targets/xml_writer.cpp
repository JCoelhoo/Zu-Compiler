// $Id: xml_writer.cpp,v 1.14 2016/04/14 21:21:57 ist178572 Exp $ -*- c++ -*-
#include <string>
#include "targets/xml_writer.h"
#include "targets/type_checker.h"
#include "ast/all.h"  // automatically generated

//---------------------------------------------------------------------------

void zu::xml_writer::do_sequence_node(cdk::sequence_node * const node, int lvl) {
  os() << std::string(lvl, ' ') << "<sequence_node size='" << node->size() << "'>" << std::endl;
  for (size_t i = 0; i < node->size(); i++)
    node->node(i)->accept(this, lvl + 2);
  closeTag(node, lvl);
}

//---------------------------------------------------------------------------

void zu::xml_writer::do_integer_node(cdk::integer_node * const node, int lvl) {
  processSimple(node, lvl);
}

void zu::xml_writer::do_double_node(cdk::double_node * const node, int lvl) {
  processSimple(node, lvl);
}

void zu::xml_writer::do_string_node(cdk::string_node * const node, int lvl) {
  processSimple(node, lvl);
}

//---------------------------------------------------------------------------

inline void zu::xml_writer::processUnaryExpression(cdk::unary_expression_node * const node, int lvl) {
  //CHECK_TYPES(_compiler, _symtab, node);
  openTag(node, lvl);
  node->argument()->accept(this, lvl + 2);
  closeTag(node, lvl);
}

void zu::xml_writer::do_neg_node(cdk::neg_node * const node, int lvl) {
  processUnaryExpression(node, lvl);
}

//---------------------------------------------------------------------------

inline void zu::xml_writer::processBinaryExpression(cdk::binary_expression_node * const node, int lvl) {
  //CHECK_TYPES(_compiler, _symtab, node);
  openTag(node, lvl);
  node->left()->accept(this, lvl + 2);
  node->right()->accept(this, lvl + 2);
  closeTag(node, lvl);
}

void zu::xml_writer::do_add_node(cdk::add_node * const node, int lvl) {
  processBinaryExpression(node, lvl);
}
void zu::xml_writer::do_sub_node(cdk::sub_node * const node, int lvl) {
  processBinaryExpression(node, lvl);
}
void zu::xml_writer::do_mul_node(cdk::mul_node * const node, int lvl) {
  processBinaryExpression(node, lvl);
}
void zu::xml_writer::do_div_node(cdk::div_node * const node, int lvl) {
  processBinaryExpression(node, lvl);
}
void zu::xml_writer::do_mod_node(cdk::mod_node * const node, int lvl) {
  processBinaryExpression(node, lvl);
}
void zu::xml_writer::do_lt_node(cdk::lt_node * const node, int lvl) {
  processBinaryExpression(node, lvl);
}
void zu::xml_writer::do_le_node(cdk::le_node * const node, int lvl) {
  processBinaryExpression(node, lvl);
}
void zu::xml_writer::do_ge_node(cdk::ge_node * const node, int lvl) {
  processBinaryExpression(node, lvl);
}
void zu::xml_writer::do_gt_node(cdk::gt_node * const node, int lvl) {
  processBinaryExpression(node, lvl);
}
void zu::xml_writer::do_ne_node(cdk::ne_node * const node, int lvl) {
  processBinaryExpression(node, lvl);
}
void zu::xml_writer::do_eq_node(cdk::eq_node * const node, int lvl) {
  processBinaryExpression(node, lvl);
}

//---------------------------------------------------------------------------

void zu::xml_writer::do_rvalue_node(zu::rvalue_node * const node, int lvl) {
  CHECK_TYPES(_compiler, _symtab, node);
  openTag(node, lvl);
  node->lvalue()->accept(this, lvl + 4);
  closeTag(node, lvl);
}

//---------------------------------------------------------------------------

void zu::xml_writer::do_lvalue_node(zu::lvalue_node * const node, int lvl) {
  //CHECK_TYPES(_compiler, _symtab, node);
  openTag(node, lvl + 2);
  closeTag(node, lvl + 2);
}

//---------------------------------------------------------------------------

void zu::xml_writer::do_assignment_node(zu::assignment_node * const node, int lvl) {
  CHECK_TYPES(_compiler, _symtab, node);
  openTag(node, lvl);
  node->lvalue()->accept(this, lvl + 2);
  openTag("rvalue", lvl + 2);
  node->rvalue()->accept(this, lvl + 4);
  closeTag("rvalue", lvl + 2);
  closeTag(node, lvl);
}

//---------------------------------------------------------------------------

void zu::xml_writer::do_evaluation_node(zu::evaluation_node * const node, int lvl) {
  CHECK_TYPES(_compiler, _symtab, node);
  openTag(node, lvl);
  node->argument()->accept(this, lvl + 2);
  closeTag(node, lvl);
}

//---------------------------------------------------------------------------

void zu::xml_writer::do_print_node(zu::print_node * const node, int lvl) {
  //CHECK_TYPES(_compiler, _symtab, node);
  if (!node->ln()){
    openTag("print", lvl + 2);
    node->argument()->accept(this, lvl + 4);
    closeTag("print", lvl + 2);
  } else {
    openTag("println", lvl + 2);
    node->argument()->accept(this, lvl + 4);
    closeTag("println", lvl + 2);
  }
}

//---------------------------------------------------------------------------

void zu::xml_writer::do_read_node(zu::read_node * const node, int lvl) {
  openTag(node, lvl);
  closeTag(node, lvl);
}

//---------------------------------------------------------------------------

void zu::xml_writer::do_for_node(zu::for_node * const node, int lvl) {
  openTag(node, lvl);
  if (node->init() != nullptr){
    openTag("initialization", lvl + 2);
    node->init()->accept(this, lvl + 4);
    closeTag("initialization", lvl + 2);
  }
  if (node->condition() != nullptr){
    openTag("condition", lvl + 2);
    node->condition()->accept(this, lvl + 4);
    closeTag("condition", lvl + 2);
  } else{
    openTag("condition", lvl + 2);
    os() << std::string(lvl+4, ' ') << "true" << std::endl;
    closeTag("condition", lvl + 2);
  }
  if (node->init() != nullptr){
    openTag("incrementation", lvl + 2);
    node->incr()->accept(this, lvl + 4);
    closeTag("incrementation", lvl + 2);
  }
  openTag("body", lvl + 2);
  node->block()->accept(this, lvl + 4);
  closeTag("body", lvl + 2);
  closeTag(node, lvl);
}

//---------------------------------------------------------------------------

void zu::xml_writer::do_if_node(zu::if_node * const node, int lvl) {
  openTag(node, lvl);
  openTag("condition", lvl + 2);
  node->condition()->accept(this, lvl + 4);
  closeTag("condition", lvl + 2);
  openTag("then", lvl + 2);
  node->block()->accept(this, lvl + 4);
  closeTag("then", lvl + 2);
  closeTag(node, lvl);
}

//---------------------------------------------------------------------------

void zu::xml_writer::do_if_else_node(zu::if_else_node * const node, int lvl) {
  openTag(node, lvl);
  openTag("condition", lvl + 2);
  node->condition()->accept(this, lvl + 4);
  closeTag("condition", lvl + 2);
  openTag("then", lvl + 2);
  node->thenblock()->accept(this, lvl + 4);
  closeTag("then", lvl + 2);
  openTag("else", lvl + 2);
  node->elseblock()->accept(this, lvl + 4);
  closeTag("else", lvl + 2);
  closeTag(node, lvl);
}

//---------------------------------------------------------------------------

void zu::xml_writer::do_and_node(zu::and_node * const node, int lvl) {
  processBinaryExpression(node, lvl); 
}

//---------------------------------------------------------------------------

void zu::xml_writer::do_or_node(zu::or_node * const node, int lvl) {
  processBinaryExpression(node, lvl);
}

//---------------------------------------------------------------------------

void zu::xml_writer::do_ret_node(zu::ret_node * const node, int lvl){
  openTag(node, lvl);
  closeTag(node, lvl);
}

//---------------------------------------------------------------------------

void zu::xml_writer::do_cont_node(zu::cont_node * const node, int lvl){
  openTag(node, lvl);
  closeTag(node, lvl);
}

//---------------------------------------------------------------------------

void zu::xml_writer::do_break_node(zu::break_node * const node, int lvl){
  openTag(node, lvl);
  closeTag(node, lvl);
}

//---------------------------------------------------------------------------

void zu::xml_writer::do_not_node(zu::not_node * const node, int lvl) {
  openTag(node, lvl);
  closeTag(node, lvl);
}

//---------------------------------------------------------------------------

void zu::xml_writer::do_function_impl_node(zu::function_impl_node * const node, int lvl){
  openTag(node, lvl);
    openTag("type", lvl + 2);
      os() << std::string(lvl+4, ' ') << node->retType()->name() << std::endl;
    closeTag("type", lvl + 2);
    openTag("name", lvl + 2);
      os() << std::string(lvl+4, ' ') << *(node->identifier()) << std::endl;
    closeTag("name", lvl + 2);
    if (node->getPublic()) {
      openTag("public", lvl + 2);
        os() << std::string(lvl+4, ' ') << node->getPublic() << std::endl;
      closeTag("public", lvl + 2); 
    } else if (node->getExtern()){
      openTag("extern", lvl + 2);
        os() << std::string(lvl+4, ' ') << node->getExtern() << std::endl;
      closeTag("extern", lvl + 2);
    } else {
      openTag("private", lvl + 2);
      closeTag("private", lvl + 2);
    }
    openTag("statements", lvl + 2);
      node->statements()->accept(this, lvl + 4);
    closeTag("statements", lvl + 2);   
    if (node->retValue() != nullptr){
      openTag("return_value", lvl + 2);
        node->retValue()->accept(this, lvl + 4);
      closeTag("return_value", lvl + 2);   
    } 
    if(node->block() != nullptr){
      openTag("body", lvl + 2);
        node->block()->accept(this, lvl + 4);
      closeTag("body", lvl + 2);
    } else {
      openTag("body", lvl + 2);
        node->block()->accept(this, lvl + 4);
      closeTag("body", lvl + 2);
    }
  closeTag(node, lvl);
}

//---------------------------------------------------------------------------

void zu::xml_writer::do_block_node(zu::block_node * const node, int lvl) {
  openTag(node, lvl);
  if (node->instructionBlock() != nullptr){
      openTag("instruction_block", lvl + 2);
      node->instructionBlock()->accept(this, lvl + 4);
      closeTag("instruction_block", lvl + 2);
  }  
  if (node->declarationBlock() != nullptr){
    openTag("declaration_block", lvl + 2);
    node->declarationBlock()->accept(this, lvl + 4);
    closeTag("declaration_block", lvl + 2);
  }
  closeTag(node, lvl);
}

//---------------------------------------------------------------------------

void zu::xml_writer::do_function_dec_node(zu::function_dec_node * const node, int lvl) {
  openTag(node, lvl);
    openTag("type", lvl + 2);
      os() << std::string(lvl+4, ' ') << node->retType()->name() << std::endl;
    closeTag("type", lvl + 2);
    openTag("name", lvl + 2);
      os() << std::string(lvl+4, ' ') << *(node->identifier()) << std::endl;
    closeTag("name", lvl + 2);
    openTag("arguments", lvl + 2);
      node->statements()->accept(this, lvl + 4);
    closeTag("arguments", lvl + 2);   
  closeTag(node, lvl);
}

//---------------------------------------------------------------------------

void zu::xml_writer::do_declaration_node(zu::declaration_node * const node, int lvl) {
  openTag(node, lvl);
    openTag("type", lvl + 2);
      os() << std::string(lvl+4, ' ') << node->type()->name() << std::endl;
    closeTag("type", lvl + 2);
    openTag("name", lvl + 2);
      node->identifier()->accept(this, lvl + 4);
    closeTag("name", lvl + 2);
    if (node->rvalue() != nullptr){
        openTag("statement", lvl + 2);
          node->rvalue()->accept(this, lvl + 4);
        closeTag("statement", lvl + 2); 
    }
    if (node->getPublic()) {
      openTag("public", lvl + 2);
        os() << std::string(lvl+4, ' ') << node->getPublic() << std::endl;
      closeTag("public", lvl + 2); 
    } else if (node->getExtern()){
      openTag("extern", lvl + 2);
        os() << std::string(lvl+4, ' ') << node->getExtern() << std::endl;
      closeTag("extern", lvl + 2);
    } else {
      openTag("private", lvl + 2);
      closeTag("private", lvl + 2);
    }  
  closeTag(node, lvl);
}

//---------------------------------------------------------------------------

void zu::xml_writer::do_function_call_node(zu::function_call_node * const node, int lvl) {
  openTag(node, lvl);
    openTag("name", lvl + 2);
      os() << std::string(lvl+4, ' ') << *(node->identifier()) << std::endl;
    closeTag("name", lvl + 2);
    if (node->statements() == nullptr){
      openTag("arguments", lvl + 2);
      node->statements()->accept(this, lvl + 4);
      closeTag("arguments", lvl + 2);  
    } 
  closeTag(node, lvl);
}

//---------------------------------------------------------------------------

void zu::xml_writer::do_identifier_node(zu::identifier_node * const node, int lvl) {
  openTag(node, lvl + 2);
      os() << std::string(lvl+4, ' ') << *(node->name()) << std::endl;
  closeTag(node, lvl + 2);
}

//---------------------------------------------------------------------------

void zu::xml_writer::do_identity_node(zu::identity_node * const node, int lvl) {
  processUnaryExpression(node, lvl);
}

//---------------------------------------------------------------------------

void zu::xml_writer::do_malloc_node(zu::malloc_node * const node, int lvl) {
  openTag(node, lvl + 2);
    node->arg()->accept(this, lvl + 4);
  closeTag(node, lvl + 2);
}

//---------------------------------------------------------------------------

void zu::xml_writer::do_address_node(zu::address_node * const node, int lvl) {
  openTag(node, lvl + 2);
    node->lval()->accept(this, lvl + 4);
  closeTag(node, lvl + 2);

}

//---------------------------------------------------------------------------

void zu::xml_writer::do_index_node(zu::index_node * const node, int lvl) {
  openTag(node, lvl);
    openTag("pointer", lvl + 2);
      node->pointer()->accept(this, lvl + 4);
    closeTag("pointer", lvl + 2);
    openTag("index", lvl + 2);
      node->index()->accept(this, lvl + 4);
    closeTag("index", lvl + 2);   
  closeTag(node, lvl);
}

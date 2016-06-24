// $Id: function_impl_node.h,v 1.3 2016/04/13 18:01:40 ist177983 Exp $ -*- c++ -*-
#ifndef __ZU_FUNCTIONIMPLNODE_H__
#define __ZU_FUNCTIONIMPLNODE_H__

#include <cdk/ast/basic_node.h>
#include <cdk/ast/sequence_node.h>
#include <cdk/ast/identifier_node.h>
#include <cdk/basic_type.h>

namespace zu {

  /**
   * Class for describing function implementation nodes.
   */
  class function_impl_node: public cdk::basic_node {
    cdk::sequence_node *_statements;
    block_node *_block;
    basic_type *_retType;
    std::string *_identifier;
    bool _public;
    bool _extern;
    cdk::expression_node *_retValue;
    
  public:
    inline function_impl_node(int lineno, basic_type *retType, std::string *identifier, cdk::sequence_node *statements, block_node *block, bool publicV, bool externV, cdk::expression_node *retValue) :
        cdk::basic_node(lineno), _statements(statements), _block(block), _retType(retType), _identifier(identifier) , _public(publicV), _extern(externV), _retValue(retValue){
    }

  public:
    inline cdk::sequence_node *statements() {
      return _statements;
    }

    inline bool getPublic(){
      return _public;
    }

    inline bool getExtern(){
      return _extern;
    }

    inline cdk::expression_node *retValue(){
      return _retValue;
    }

    inline std::string *identifier() {
      return _identifier;
    }

    inline block_node *block() {
      return _block;
    }

    inline basic_type *retType() {
      return _retType;
    }

    void accept(basic_ast_visitor *sp, int level) {
      sp->do_function_impl_node(this, level);
    }

  };

} // zu

#endif

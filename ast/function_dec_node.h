// $Id: function_dec_node.h,v 1.4 2016/04/14 13:41:01 ist177983 Exp $ -*- c++ -*-
#ifndef __ZU_FUNCTIONDECNODE_H__
#define __ZU_FUNCTIONDECNODE_H__

#include <cdk/ast/basic_node.h>
#include <cdk/basic_type.h>
#include <cdk/ast/identifier_node.h>

namespace zu {

  /**
   * Class for describing function declaration nodes.
   */
  class function_dec_node: public cdk::basic_node { 
    cdk::sequence_node *_statements;
    basic_type *_retType;
    std::string *_identifier;
    bool _public;
    bool _extern;

  public:
    inline function_dec_node(int lineno, basic_type *retType, std::string *identifier, cdk::sequence_node *statements, bool publicV, bool externV) :
        cdk::basic_node(lineno), _statements(statements), _retType(retType), _identifier(identifier), _public(publicV), _extern(externV) {
    }

  public:
    inline cdk::sequence_node *statements() {
      return _statements;
    }

    inline std::string *identifier() {
      return _identifier;
    }

    inline basic_type *retType() {
      return _retType;
    }
    
    inline bool getPublic(){
      return _public;
    }

    inline bool getExtern(){
      return _extern;
    }

    void accept(basic_ast_visitor *sp, int level) {
      sp->do_function_dec_node(this, level);
    }

  };

} // zu

#endif

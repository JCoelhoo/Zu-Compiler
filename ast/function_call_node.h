// $Id: function_call_node.h,v 1.3 2016/04/14 13:03:01 ist177983 Exp $ -*- c++ -*-
#ifndef __ZU_FUNCTIONCALLNODE_H__
#define __ZU_FUNCTIONCALLNODE_H__

#include <cdk/ast/basic_node.h>
#include <cdk/ast/identifier_node.h>

namespace zu {

  /**
   * Class for describing function call nodes.
   */
  class function_call_node: public cdk::expression_node {
	std::string *_identifier;
	cdk::sequence_node *_statements;

    

  public:
    inline function_call_node(int lineno, std::string *identifier, cdk::sequence_node *statements) :
        cdk::expression_node(lineno), _identifier(identifier), _statements(statements) {
    }

  public:
    inline cdk::sequence_node *statements() {
      return _statements;
    }

    inline std::string *identifier() {
      return _identifier;
    }

    void accept(basic_ast_visitor *sp, int level) {
      sp->do_function_call_node(this, level);
    }

  };

} // zu

#endif

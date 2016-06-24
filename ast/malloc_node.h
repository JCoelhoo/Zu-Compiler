// $Id: malloc_node.h,v 1.3 2016/04/14 14:33:56 ist177983 Exp $ -*- c++ -*-
#ifndef __ZU_AST_MALLOC__H__
#define __ZU_AST_MALLOC__H__

#include <cdk/ast/expression_node.h>

namespace zu {

  /**
   * Class for describing the malloc operator
   */
  class malloc_node: public cdk::expression_node {
  	cdk::expression_node *_arg;

  public:
    inline malloc_node(int lineno, cdk::expression_node *arg) :
        cdk::expression_node(lineno), _arg(arg){
    }

  public:
    inline cdk::expression_node *arg(){
        return _arg;
    }

    void accept(basic_ast_visitor *sp, int level) {
      sp->do_malloc_node(this, level);
    }

  };

} // zu

#endif

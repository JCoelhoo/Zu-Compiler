// $Id: print_node.h,v 1.2 2016/04/11 17:53:43 ist177983 Exp $ -*- c++ -*-
#ifndef __ZU_PRINTNODE_H__
#define __ZU_PRINTNODE_H__

#include <cdk/ast/expression_node.h>

namespace zu {

  /**
   * Class for describing print nodes.
   */
  class print_node: public cdk::basic_node {
    cdk::expression_node *_argument;
    bool _ln;

  public:
    inline print_node(int lineno, cdk::expression_node *argument, bool ln) :
        cdk::basic_node(lineno), _argument(argument), _ln(ln) {
    }

  public:
    inline cdk::expression_node *argument() {
      return _argument;
    }

    inline bool ln() {
      return _ln;
    }

    void accept(basic_ast_visitor *sp, int level) {
      sp->do_print_node(this, level);
    }

  };

} // zu

#endif

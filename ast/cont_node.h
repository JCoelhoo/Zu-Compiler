// $Id: cont_node.h,v 1.2 2016/03/15 12:49:26 ist178572 Exp $ -*- c++ -*-
#ifndef __ZU_CONTNNODE_H__
#define __ZU_CONTNODE_H__

#include <cdk/ast/expression_node.h>

namespace zu {

  /**
   * Class for describing continue nodes.
   */
  class cont_node: public cdk::basic_node {

  public:
    inline cont_node(int lineno) :
        cdk::basic_node(lineno) {
    }

    void accept(basic_ast_visitor *sp, int level) {
      sp->do_cont_node(this, level);
    }

  };

} // zu

#endif

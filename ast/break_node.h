// $Id: break_node.h,v 1.2 2016/03/03 16:16:37 ist178572 Exp $ -*- c++ -*-
#ifndef __ZU_BREAKNNODE_H__
#define __ZU_BREAKNODE_H__

#include <cdk/ast/expression_node.h>

namespace zu {

  /**
   * Class for describing break nodes.
   */
  class break_node: public cdk::basic_node {

  public:
    inline break_node(int lineno) :
        cdk::basic_node(lineno) {
    }

    void accept(basic_ast_visitor *sp, int level) {
      sp->do_break_node(this, level);
    }

  };

} // zu

#endif

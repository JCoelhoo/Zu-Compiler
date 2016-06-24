// $Id: or_node.h,v 1.3 2016/03/17 19:01:29 ist177983 Exp $ -*- c++ -*-
#ifndef __ZU_OR_H__
#define __ZU_OR_H__

#include <cdk/ast/binary_expression_node.h>

namespace zu {

  /**
   * Class for describing the or operator
   */
  class or_node: public cdk::binary_expression_node {
  public:
    /**
     * @param lineno source code line number for this node
     * @param left first operand
     * @param right second operand
     */
    inline or_node(int lineno, cdk::expression_node *left, cdk::expression_node *right) :
        cdk::binary_expression_node(lineno, left, right) {
    }

    /**
     * @param sp semantic processor visitor
     * @param level syntactic tree level
     */
    void accept(basic_ast_visitor *sp, int level) {
      sp->do_or_node(this, level);
    }

  };

} // zu

#endif

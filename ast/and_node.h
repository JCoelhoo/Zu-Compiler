// $Id: and_node.h,v 1.2 2016/03/15 12:49:26 ist178572 Exp $ -*- c++ -*-
#ifndef __ZU_AST_EXPRESSION_AND_H__
#define __ZU_AST_EXPRESSION_AND_H__

#include <cdk/ast/binary_expression_node.h>

namespace zu {

  /**
   * Class for describing the and ('&') operator
   */
  class and_node: public cdk::binary_expression_node {
  public:
    /**
     * @param lineno source code line number for this node
     * @param left first operand
     * @param right second operand
     */
    inline and_node(int lineno, cdk::expression_node *left, cdk::expression_node *right) :
        cdk::binary_expression_node(lineno, left, right) {
    }

    /**
     * @param sp semantic processor visitor
     * @param level syntactic tree level
     */
    void accept(basic_ast_visitor *sp, int level) {
      sp->do_and_node(this, level);
    }

  };

} // zu

#endif

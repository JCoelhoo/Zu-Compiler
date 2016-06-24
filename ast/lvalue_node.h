// $Id: lvalue_node.h,v 1.2 2016/03/17 19:01:29 ist177983 Exp $
#ifndef __ZU_LVALUE_H__
#define __ZU_LVALUE_H__

#include <cdk/ast/expression_node.h>


namespace zu {

  /**
   * Class for describing syntactic tree leaves for holding lvalues.
   */
  class lvalue_node: public cdk::expression_node{

  public:
    inline lvalue_node(int lineno) :
        cdk::expression_node(lineno) {
    }

    /**
     * @param sp semantic processor visitor
     * @param level syntactic tree level
     */
    virtual void accept(basic_ast_visitor *sp, int level) {
      sp->do_lvalue_node(this, level);
    }

  };

} // zu

#endif

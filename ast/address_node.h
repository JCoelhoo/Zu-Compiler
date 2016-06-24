// $Id: address_node.h,v 1.3 2016/04/14 14:33:56 ist177983 Exp $ -*- c++ -*-
#ifndef __ZU_ADDRESS_H__
#define __ZU_ADDRESS_H__

#include <cdk/ast/unary_expression_node.h>

namespace zu {

  /**
   * Class for describing the address operator
   */
  class address_node: public cdk::expression_node  {
  zu::lvalue_node *_lval;
  public:
    inline address_node(int lineno, zu::lvalue_node *lval) :
        cdk::expression_node(lineno), _lval(lval) {
    }

	public:
		inline zu::lvalue_node *lval(){
		    return _lval;
		}

    /**
     * @param sp semantic processor visitor
     * @param level syntactic tree level
     */
    void accept(basic_ast_visitor *sp, int level) {
      sp->do_address_node(this, level);
    }

  };

} // zu

#endif

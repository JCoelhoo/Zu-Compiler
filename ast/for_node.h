// $Id: for_node.h,v 1.7 2016/04/13 19:14:10 ist177983 Exp $ -*- c++ -*-
#ifndef __ZU_FORNODE_H__
#define __ZU_FORNODE_H__

#include <cdk/ast/expression_node.h>
#include <cdk/ast/basic_node.h>

namespace zu {

  /**
   * Class for describing for-cycle nodes.
   */
  class for_node: public cdk::basic_node {
    cdk::sequence_node *_init, *_condition,  *_incr;
    cdk::basic_node *_block;

  public:
    inline for_node(int lineno, cdk::sequence_node *init, cdk::sequence_node *condition, cdk::sequence_node *incr, cdk::basic_node *block) :
        cdk::basic_node(lineno), _init(init),_condition(condition), _incr(incr),_block(block) {
    }

  public:
    inline cdk::sequence_node *init() {
      return _init;
    }
    inline cdk::sequence_node *condition() {
      return _condition;
    }
    inline cdk::sequence_node *incr() {
      return _incr;
    }
    inline cdk::basic_node *block() {
      return _block;
    }

    void accept(basic_ast_visitor *sp, int level) {
      sp->do_for_node(this, level);
    }

  };

} // zu

#endif

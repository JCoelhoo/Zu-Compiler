// $Id: index_node.h,v 1.4 2016/04/13 20:54:01 ist177983 Exp $ -*- c++ -*-
#ifndef __ZU_INDEXNODE_H__
#define __ZU_INDEXNODE_H__


namespace zu {

  /**
   * Class for describing return nodes.
   */
  class index_node: public lvalue_node {
  cdk::expression_node *_pointer;
  cdk::expression_node *_index;

  public:
    inline index_node(int lineno, cdk::expression_node *pointer, expression_node *index) :
        lvalue_node(lineno), _pointer(pointer), _index(index) {
    }

  public:
    inline cdk::expression_node *index () {
      return _index;
    }
  public:
    inline cdk::expression_node *pointer() {
      return _pointer;
    }

    void accept(basic_ast_visitor *sp, int level) {
      sp->do_index_node(this, level);
    }

  };

} // zu

#endif

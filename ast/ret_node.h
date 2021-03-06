// $Id: ret_node.h,v 1.2 2016/03/16 20:26:11 ist178572 Exp $ -*- c++ -*-
#ifndef __ZU_RETNODE_H__
#define __ZU_RETNODE_H__


namespace zu {

  /**
   * Class for describing return nodes.
   */
  class ret_node: public cdk::basic_node {

  public:
    inline ret_node(int lineno) :
        cdk::basic_node(lineno) {
    }

  public:
    void accept(basic_ast_visitor *sp, int level) {
      sp->do_ret_node(this, level);
    }

  };

} // zu

#endif

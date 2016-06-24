// $Id: block_node.h,v 1.3 2016/04/13 13:29:57 ist177983 Exp $ -*- c++ -*-
#ifndef __ZU_BLOCKNODE_H__
#define __ZU_BLOCKNODE_H__

#include <cdk/ast/basic_node.h>
#include <cdk/ast/expression_node.h>

namespace zu {

  /**
   * Class for describing block nodes.
   */
  class block_node: public cdk::basic_node {
    cdk::sequence_node *_declarationBlock;
    cdk::sequence_node *_instructionBlock;

  public:
    inline block_node(int lineno, cdk::sequence_node *declarationBlock, cdk::sequence_node *instructionBlock) :
        cdk::basic_node(lineno), _declarationBlock(declarationBlock), _instructionBlock(instructionBlock){
    }

  public:
    inline cdk::basic_node *declarationBlock() {
      return _declarationBlock;
    }
    
    inline cdk::basic_node *instructionBlock() {
      return _instructionBlock;
    }

    void accept(basic_ast_visitor *sp, int level) {
      sp->do_block_node(this, level);
    }

  };

} // zu

#endif

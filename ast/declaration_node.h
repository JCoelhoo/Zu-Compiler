// $Id: declaration_node.h,v 1.6 2016/05/13 16:30:07 ist178572 Exp $ -*- c++ -*-
#ifndef __ZU_DECLARATIONNODE_H__
#define __ZU_DECLARATIONNODE_H__

#include <ast/rvalue_node.h>
#include <cdk/ast/basic_node.h>
#include <cdk/basic_type.h>
#include <ast/identifier_node.h>

namespace zu {

  /**
   * Class for describing assignment nodes.
   */
  class declaration_node: public cdk::basic_node {
    
    basic_type *_type;
    identifier_node *_identifier;
    cdk::expression_node *_rvalue;
    bool _external;
    bool _public;
   

  public:
    inline declaration_node(int lineno, basic_type *type, identifier_node *identifier, cdk::expression_node *rvalue, bool externalV, bool publicV) :
        cdk::basic_node(lineno), _type(type), _identifier(identifier), _rvalue(rvalue), _external(externalV), _public(publicV) {
    }

  public:

    inline cdk::expression_node *rvalue() {
      return _rvalue;
    }

    inline identifier_node *identifier() {
      return _identifier;
    }

    inline basic_type *type() {
      return _type;
    }

    inline bool getExtern() {
      return _external;
    }

    virtual void type(basic_type *type) {
      _type = type;
    }

    inline bool getPublic() {
      return _public;
    }

    void accept(basic_ast_visitor *sp, int level) {
      sp->do_declaration_node(this, level);
    }

  };

} // zu

#endif

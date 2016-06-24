// $Id: symbol.h,v 1.8 2016/05/18 10:46:18 ist177983 Exp $ -*- c++ -*-
#ifndef __ZU_SEMANTICS_SYMBOL_H__
#define __ZU_SEMANTICS_SYMBOL_H__

#include <string>
#include <cdk/basic_type.h>

namespace zu {

    class symbol {
      basic_type *_type;
      std::string _name;
      std::vector<basic_type> _args;
      bool _pub, _ext, _declared;
      size_t _offset;

    public:
      inline symbol(basic_type *type, std::string &name, bool pub, bool ext, size_t offset) :
          _type(type), _name(name) , _pub(pub), _ext(ext), _offset(offset){
      }

      inline symbol(basic_type *type, std::string &name, std::vector<basic_type> args, bool pub, bool ext, bool declared):
          _type(type), _name(name), _args(args) , _pub(pub), _ext(ext), _declared(declared){
      }

      virtual ~symbol() {
        delete _type;
      }

      inline basic_type *type() {
        return _type;
      }
      inline std::string &name() {
        return _name;
      }
      inline bool getPublic() {
        return _pub;
      }
      inline bool getExternal() {
        return _ext;
      }
      inline size_t offset() {
        return _offset;
      }
      inline bool declared() {
        return _declared;
      }
      inline std::vector<basic_type> args() {
        return _args;
      }
    };

} // zu

#endif

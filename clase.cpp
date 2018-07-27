// Example program
#include <iostream>
#include <string>
#include <set>

namespace Glock {

    class String : public std::string {
    public:
        String() : std::string() { }
    	String( const std::string& s ) : std::string( s ) { }
    	String( const std::string& s, std::size_t n ) : std::string( s,n ) { }
    	String( const char *s, std::size_t n ) : std::string( s,n ) { }
    	String( const char *s ) : std::string( s ) { }
    	String( std::size_t n, char c ) : std::string ( n,c ) { }
    	template <class InputIterator>
    	String( InputIterator first, InputIterator last ) : std::string( first,last ) { }
    	
    	bool operator== (const String &other) const {
    	    if (compare(other) != 0) {
    	        return false;
    	    }
    	    
    	    return true;
    	}
    	
    	void Replace (const String &target, const String &source) {
    	    size_t pos = find(target);
    	    replace(pos, target.size(), source);
        }
        
        bool endsWith (String const &target) {
            if (length() >= target.length()) {
                return (0 == compare (length() - target.length(), target.length(), target));
            } else {
                return false;
            }
        }
        
        bool startsWith (String const &target) {
            if(find(target) == 0) {
        		return true;
            } else {
        		return false;
            }
        }
    };
}


class User {
private:
    long id;
    Glock::String name;
    Glock::String email;
    
public:
    bool operator== (const User &other) const {
        if (getEmail() == other.getEmail()
        ) {
            return true;
        }
        return false;
    }
    
    bool operator< (const User &other) const {
        return (getEmail() < other.getEmail());
    }

    long getId () const {
        return id;
    }

    Glock::String getName () const {
        return name;
    }
    
    Glock::String getEmail () const {
        return email;
    }
    
    void setName (Glock::String name_) {
        name = name_;
    }
    
    void setEmail (Glock::String email_) {
        email = email_;
    }
    
    static Glock::String save (User user) {
        Glock::String r = "insert into user(name, age) values('{name}', '{email}')";
        r.Replace("{name}", user.getName());
        r.Replace("{email}", user.getEmail());
        return r;
    }
};

int main()
{
  User user1;
  user1.setName("jose");
  user1.setEmail("jose@email.com");
  
  User user2;
  user2.setName("jose");
  user2.setEmail("jose@email.com");
  
  std::set<User> users;
  users.emplace(user1);
  users.emplace(user2);
  
  //users.insert(user2);
  //std::cout << (user1 == user2) << std::endl;
  
  std::cout << users.size() << std::endl;
}

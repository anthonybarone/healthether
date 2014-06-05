class Permission
  
# The Chassis Permission class is a Domain Specific Language that defines and checks the permissions for an entire application. An initializer takes a User model record passed in from the application_cotroller.rb Permission.new(current_user) method call.  At this time, current_user can have one of three basic permission values - logged out guest, logged in user.admin = N, logged in user.admin = Y. In it we’ll use a permit_action method that takes a controller and an array of actions passed in through symbols and the resource as a code block to have access to user_id attributes.  Note that we’re using a permit_all method to give admin users access to everything.

# The application needs to restrict access to certain items for a given resource too.  For example, we only want users to be able to edit and update a topic that they’ve created themselves.  Therefore, we need to pass in the resource record so that we can perform authorization based on various attributes of it. We could pass this resource in as an optional third argument.

# Whenever Ruby creates a new object, it looks for a method named initialize and executes it. So one simple thing we can do is use an initialize method to accept the user argument and put default values into all the instance variables. In this case, we are calling permit_action, permit_param and permit_all to initialize the following instance variables @permitted_actions (resource based access control), @permitted_params (attribute based access control) and @permit_all (role based access control).

# START OF INITIALIZATION DECLARATION--START OF INITIALIZATION DECLARATION--
# START OF INITIALIZATION DECLARATION--START OF INITIALIZATION DECLARATION--
# START OF INITIALIZATION DECLARATION--START OF INITIALIZATION DECLARATION--
# START OF INITIALIZATION DECLARATION--START OF INITIALIZATION DECLARATION--

def initialize(current_user_object)
# pemmission definitions for all users (guest, logged in, logged in admin)
  permit_action :users, [:new, :create]
  permit_action :sessions, [:new, :create, :destroy]
  permit_action :password_resets, [:new, :create, :edit, :update]
  permit_action :concepts, [:new, :create, :edit, :update]
  permit_action :topics, [:index, :show]
  permit_action :pages, [:concept_1_the_idea, :concept_2_product_creator, :concept_3_product_types, :concept_4_product_specs, :concept_5_key_players, :concept_6_contracts, :concept_7_payments, :concept_8_perform_services]
# permision definitions when current_user != nil (require_sign_in)
  if current_user_object
    permit_action :users, [:show, :edit, :update, :destroy]
    permit_action :topics, [:new, :create]
    permit_action :topics, [:edit, :update] do |topic|
      topic.user_id == current_user_object.id
    end
    permit_param :topic, [:name]
  # permission defintion when current_user.admin? == true  

  #  permit_all if user.admin? # Commented out permit all until I get to this lesson in pragmatic programmers.

  end
end

# The permit_action method will be a little trickier as it takes one or more controller names and action names from the initialize method. A quick way to handle this is to wrap the arguments in a call to Array. This will make a single item into an array with one element but return an array that is passed in unchanged. We then loop through each controller and action and store this information in an instance variable so that we can use it later. We’ll store this data in a hash with an array for a key as a quick way to do a lookup of multiple items. We can pass in either strings or symbols as controller or action names and we need to standardize on either one or the other to make it easier to look them up. We’ll use strings as using symbols can introduce memory leaks if the content is dynamic.  Finally, make sure to default the @permitted_actions instance variable as an empty hash.  

# Now that the permit_action? is accepting a third resource argument, we can perform an authorization check on its attributes by having the permit_action method accept a block that we can pass that resource object into so that we can perform the check there. We’ll modify the permissions that we specify in the Permission class so that the current topic is only checked for the edit and update actions. 

# Here we use the &block notation to pass the block as a parameter to the permit_action method.  The block of code defined above checks if a topic controller edit & update action      topic.user_id == user.id.  Basically, the controller action combination is always true based on the permissions set by the initialize method unless the controller user_id does not match the user_id.

# START OF FILLING IN INITIALIZATION MISSING PIECES--
# START OF FILLING IN INITIALIZATION MISSING PIECES--
# START OF FILLING IN INITIALIZATION MISSING PIECES--
# START OF FILLING IN INITIALIZATION MISSING PIECES--
    
def permit_action(controllers, actions, &block)
# Ruby's Double Pipe (logical or) / Or Equals operator does not reset @permitted_actions each time permit_action is called.  Rather, it assigns a default value to a variable only if that variable isn’t already set. Otherwise, it will continue to add to the @permitted_actions hash.  
  @permitted_actions ||= {}
  Array(controllers).each do |controller|
    Array(actions).each do |action|
# Now we have to fill in the missing pieces between the definition (initialize) and the check (permit_action?). We’ll modify the permit_action method to take a block. We’ll need to keep track of this so we’ll set it as a value in our @permitted_actions hash. If no block is passed in we’ll set the value to true.  The controller and action key is assigned the code block or true if no code block is sent.
#somthing like this: @permitted_action { [["user", "show"] => "true"], [["user", "edit"] => "user.user_id == current_user.id"], [["user", "update"] => "user.user_id == current_user.id"] }
      @permitted_actions[[controller.to_s, action.to_s]] = block || true
    end
  end
end

# Restricting Access to Certain Items

def permit_param(resources, attributes)

# Ruby's Double Pipe (logical or) / Or Equals operator does not reset @permitted_params each time permit_action is called.  Rather, it assigns a default value to a variable only if that variable isn’t already set. Otherwise, it will continue to add to the @permitted_params hash.

  @permitted_params ||= {}
  Array(resources).each do |resource|
    @permitted_params[resource] ||= []
    @permitted_params[resource] += Array(attributes)
  end
end

# The permit_all method assigns an instance variable @allow_all to true.  
def permit_all
  @permit_all = true
end

# END OF INITIALIZATION--END OF INITIALIZATION--END OF INITIALIZATION--END OF INITIALIZATION
# END OF INITIALIZATION--END OF INITIALIZATION--END OF INITIALIZATION--END OF INITIALIZATION
# END OF INITIALIZATION--END OF INITIALIZATION--END OF INITIALIZATION--END OF INITIALIZATION
# END OF INITIALIZATION--END OF INITIALIZATION--END OF INITIALIZATION--END OF INITIALIZATION

# START OF THE CHECK--START OF THE CHECK--START OF THE CHECK--START OF THE CHECK
# START OF THE CHECK--START OF THE CHECK--START OF THE CHECK--START OF THE CHECK
# START OF THE CHECK--START OF THE CHECK--START OF THE CHECK--START OF THE CHECK
# START OF THE CHECK--START OF THE CHECK--START OF THE CHECK--START OF THE CHECK


# permit_action? query method will now return either TRUE OR A BLOCK. It checks if @permit_all is set to true or if the @permitted_actions hash has a value of true for the key with the controller and action that’s passed in. We should also check that these instance variables are defined before checking their values to reduce the chance of warnings but we don’t do that here.

# In order to restrict access to specific items, the pemit_action? method need to pass in a third argument which is the resource record so that we can perform authorizaion based on various attributes of it. It’s easy enough to add this as an optional argument in order to perform an authorization check on its attributes in the permit_action method.  What we’ll do is have the permit_action method accept a block that we can pass the resource object into so that we can perform the check there. 

# To demonstrate, we’ll modify the permissions that we specify in the Permission class so that the current topic is only checked for the edit and update actions.

# || (logical or), && (logical and), = %= /= -= += |= &= >>= <<= *= &&= ||= **= ^= (assignment), <=> == === != =~ !~ (equality and pattern match operators)

  def permit_action?(controller, action, resource = nil)
# create local variable permitted that stores either true or is a block or is nil based on initialization definitions and methods (permit_action, permit_param, permit_all).  
    permitted = @permit_all || @permitted_actions[[controller.to_s, action.to_s]]
# @permitted_actions will now return either TRUE or a BLOCK.  From the line above, permitted is either true or is a block or is nil. The line below then checks that (1) permitted is not nil and either (2a) permitted is true or (2b) resource is not nil and permitted.call triggers the code block against the resource passed in which returns true or false.  This last step is how you perform an authorization check on the resource attributes by permitted being set to a block in the initialize and permit_action initialization methods.
    permitted && (permitted == true || resource && permitted.call(resource))
  end

# permit_param? query method checks if @permit_all
  def permit_param?(resource, attribute)
    if @permit_all
      true
    elsif @permitted_params && @permitted_params[resource]
      @permitted_params[resource].include? attribute
    end
  end

# permit_params! method.  A dynamic implementation of strong parameters.
# returns a hash of permitted parameters
  def permit_params!(params)
    if @permit_all
      params.permit!
    elsif @permitted_params
      @permitted_params.each do |resource, attributes|
        if params[resource].respond_to? :permit
          params[resource] = params[resource].permit(*attributes)
        end
      end
    end
  end
  
  if __FILE__ == $0
    puts "Controller Name: figure out how to print out to screen"
    puts "Action Name: figure out how to print out to screen"
    puts "Current User: figure out how to print out to screen"
    puts "Permitted Actions: figure out how to print out to screen"
  end  
  
end
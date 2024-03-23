class ProductPolicy < ApplicationPolicy
    attr_reader :uset, :product
    def index?
      true
    end
  
    def show?
      true
    end
  
    def create?
      user.seller? || record.user == user
    end
  
    def update?
      user.seller? || record.user == user
    end
  
    def destroy?
      user.seller? || record.user == user
    end
  
    
    
    class Scope < Scope
      # NOTE: Be explicit about which records you allow access to!
      # def resolve
      #   scope.all
      # end
    end
  end
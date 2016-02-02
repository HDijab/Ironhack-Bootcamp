class ContactsController < ApplicationController
  def index
    @contacts = Contact.all.order("name ASC")
  end

  def new
  end

  def favourite
    contact = Contact.find(params[:id])
    contact.favourite = !contact.favourite
    contact.save
    redirect_to('/')
  end

  def favourites
    @contacts = Contact.where("favourite == ?", true).order("name ASC")
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def search
    @contact = Contact.find_by('name LIKE ?', "%#{params[:search]}%")
  end

  def create
    redirect_to("/new") and return unless Contact.valid?(params[:contact])

    contact = Contact.new(
      :name => params[:contact][:name],
      :address => params[:contact][:address],
      :phone_number => params[:contact][:phone],
      :email_address => params[:contact][:email])

    contact.save

    redirect_to("/contacts")
  end
end

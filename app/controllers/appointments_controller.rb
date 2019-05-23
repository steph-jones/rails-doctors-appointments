class AppointmentsController < ApplicationController
  before_action :set_doctor

  def index
    @sickvisits = @doctor.appointments.where(apt: 'Sick Visit')
    @annuals = @doctor.appointments.where(apt: 'Annual')
    @checkups = @doctor.appointments.where(apt: 'Check Up')
  end

  def new
    @users = User.all - @doctor.users
    @appointment = @doctor.appointments.new
  end

  def create
    @appointment = @doctor.appointments.new(appointment_params)
    if @appointment.save
      redirect_to doctor_appointments_path(@doctor)
    else
      render :new
    end
  end

  def destroy
    @appointment = @doctor.appointments.find(params[:id])
    @appointment.destroy
    redirect_to doctor_appointments_path(@doctor)
  end

 private
   def set_doctor
     @doctor = Doctor.find(params[:doctor_id]) 
   end

   def appointment_params
     params.require(:appointment).permit(:apt, :user_id)
   end
end
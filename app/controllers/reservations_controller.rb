class ReservationsController < ApplicationController

  def index
    @guest = Guest.all
    @phone_numbers = PhoneNumber.all
    @reservations = Reservation.all
    @results =  @guest + @phone_numbers + @reservations
    json_response(@results)
  end

  def create
    guest = Guest.new
    reservation = Reservation.new
    phone = PhoneNumber.new
    payloads = params.to_enum.to_h
    phones_arr = []
    payloads.each do |input|
      if input.last.class.name == 'String'
        update_reservation(reservation, input)
      elsif input.last.class.name == 'Integer'
        update_guest(guest, input)
        update_reservation(reservation, input)
      else
        if input.first.include?('guest')
          guest_dtls = input.last.to_enum.to_h
          guest_dtls.each do |gd|
            update_guest(guest, gd)
            if gd.first.include?('phone')
              phone.guest_id = guest.id
              phone.phone_number = gd.last
            end
          end
        else
          res_dtls = input.last.to_enum.to_h
          res_dtls.each do |rd|
            update_guest(guest, rd)
            update_reservation(reservation, rd)
            if rd.first.include?('guest_details')
              rd_guest_dtls = rd.last.to_enum.to_h
              rd_guest_dtls.each do |rd_gd|
                update_guest(guest, rd_gd)
              end
            elsif rd.first.include?('phone')
              rd.last.each do |pn|
                phones_arr.push(pn)
              end
            end
          end
        end
      end
    end
    if guest.save
      reservation.guest_id = guest.id
      reservation.save
      if phones_arr.present?
        phones_arr.each do |pa|
          x = PhoneNumber.new
          x.guest_id = guest.id
          x.phone_number = pa
          x.save
        end
      else
        phone.guest_id = guest.id
        phone.save
      end
      json_response(reservation, :created)
    else
      json_response(reservation, :expectation_failed)
    end
  end


  def update_reservation(reservation, payload_params)
    reservation.code = payload_params.last if payload_params.first.include?('code')
    reservation.currency = payload_params.last if payload_params.first.include?('currency')
    reservation.end_date = payload_params.last.to_datetime if payload_params.first.include?('end_date')
    reservation.payout_price = payload_params.last.to_f if payload_params.first.include?('payout')
    reservation.security_price = payload_params.last.to_f if payload_params.first.include?('security_price')
    reservation.start_date = payload_params.last.to_datetime if payload_params.first.include?('start_date')
    reservation.status = payload_params.last if payload_params.first.include?('status')
    reservation.total_price = payload_params.last.to_f if payload_params.first.include?('total')
    reservation.nights = payload_params.last if payload_params.first.include?('nights')
    reservation.guests = payload_params.last if payload_params.first.include?('guests')
  end

  def update_guest(guest, payload_params)
    guest.adults = payload_params.last if payload_params.first.include?('adults')
    guest.children = payload_params.last if payload_params.first.include?('children')
    guest.infants = payload_params.last if payload_params.first.include?('infants')
    guest.email = payload_params.last if payload_params.first.include?('email')
    guest.first_name = payload_params.last if payload_params.first.include?('first_name')
    guest.last_name = payload_params.last if payload_params.first.include?('last_name')
  end

  def update
    current_reservation = Reservation.find_by_code(params["id"])
    if current_reservation.present?
    reservation_params = params.to_enum.to_h
    reservation_params.each do |res_param|
      update_reservation(current_reservation, res_param)
      current_reservation.save
    end
    json_response(current_reservation, :accepted)
    else
    json_response(current_reservation, :not_found)  
    end
  end


end

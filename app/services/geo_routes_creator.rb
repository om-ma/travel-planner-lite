class GeoRoutesCreator
  def initialize origin:, destination:
    @origin = origin
    @destination = destination
  end

  def process
    ActiveRecord::Base.transaction do
      delete_old_records
      retrieve_new_routes
      insert_routes

      {msg: "created successfully #{@inserted.rows.length} records", status: 201}
    end
  rescue
    {msg: 'something went wrong', status: 422}
  end

  private

  def delete_old_records
    existing = GeoRoute.with_origin_destination(@origin.id, @destination.id)
    existing.delete_all
  end

  def retrieve_new_routes
    @routes_hash = GeoDirection.get_routes(origin: @origin, destination: @destination)
  end

  def insert_routes
    @inserted = GeoRoute.insert_all! @routes_hash
  end
end
class Gratitude
  include Aws::Record

  string_attr :id, hash_key: true
  integer_attr :count, hash_key: true
  epoch_time_attr :created_at

  def as_json
    {
      id: id,
      count: count,
      created_at: created_at
    }
  end
end

module PoliticiansHelper
  def total_donor_contributions(object)

    total_contributions = 0

    object["donors"].each do |donor|
      total_contributions += donor["donor_total_contribution"].to_f
    end

    return total_contributions

  end
end

import Foundation

// MARK: - AddressData
struct AddressData: Decodable {
    let suggestions: [Suggestion]?
}

// MARK: - Suggestion
struct Suggestion: Decodable {
    let value, unrestrictedValue: String?
    let data: DataClass

    enum CodingKeys: String, CodingKey {
        case value
        case unrestrictedValue = "unrestricted_value"
        case data
    }
}

// MARK: - DataClass
struct DataClass: Decodable { // swiftlint:disable identifier_name
    let postalCode: String?
    let country, countryISOCode: String?
    let federalDistrict: String?
    let regionFiasID, regionKladrID, regionISOCode, regionWithType, regionType, regionTypeFull, region: String?
    let areaFiasID, areaKladrID, areaWithType, areaType, areaTypeFull, area: String?
    let cityFiasID, cityKladrID, cityWithType, cityType, cityTypeFull, city, cityArea: String?
    let cityDistrictFiasID, cityDistrictKladrID, cityDistrictWithType: String?
    let cityDistrictType, cityDistrictTypeFull, cityDistrict: String?
    let settlementFiasID, settlementKladrID, settlementWithType, settlementType, settlementTypeFull, settlement: String?
    let streetFiasID, streetKladrID, streetWithType, streetType, streetTypeFull, street: String?
    let steadFiasID, steadCadnum, steadType, steadTypeFull, stead: String?
    let houseFiasID, houseKladrID, houseCadnum, houseType, houseTypeFull, house: String?
    let blockType, blockTypeFull, block, entrance: String?
    let floor, flatFiasID, flatCadnum, flatType, flatTypeFull, flat, flatArea: String?
    let squareMeterPrice, flatPrice: String?
    let postalBox: String?
    let fiasID, fiasCode, fiasLevel, fiasActualityState: String?
    let kladrID, geonameID, capitalMarker: String?
    let okato, oktmo, taxOffice, taxOfficeLegal: String?
    let timezone, geoLat, geoLon: String?
    let beltwayHit, beltwayDistance, metro, divisions: String?
    let qcGeo: String?
    let qcComplete, qcHouse: String?
    let historyValues: [String]?
    let unparsedParts, source, qc: String?

    enum CodingKeys: String, CodingKey {
        case postalCode = "postal_code"
        case country
        case countryISOCode = "country_iso_code"
        case federalDistrict = "federal_district"
        case regionFiasID = "region_fias_id"
        case regionKladrID = "region_kladr_id"
        case regionISOCode = "region_iso_code"
        case regionWithType = "region_with_type"
        case regionType = "region_type"
        case regionTypeFull = "region_type_full"
        case region
        case areaFiasID = "area_fias_id"
        case areaKladrID = "area_kladr_id"
        case areaWithType = "area_with_type"
        case areaType = "area_type"
        case areaTypeFull = "area_type_full"
        case area
        case cityFiasID = "city_fias_id"
        case cityKladrID = "city_kladr_id"
        case cityWithType = "city_with_type"
        case cityType = "city_type"
        case cityTypeFull = "city_type_full"
        case city
        case cityArea = "city_area"
        case cityDistrictFiasID = "city_district_fias_id"
        case cityDistrictKladrID = "city_district_kladr_id"
        case cityDistrictWithType = "city_district_with_type"
        case cityDistrictType = "city_district_type"
        case cityDistrictTypeFull = "city_district_type_full"
        case cityDistrict = "city_district"
        case settlementFiasID = "settlement_fias_id"
        case settlementKladrID = "settlement_kladr_id"
        case settlementWithType = "settlement_with_type"
        case settlementType = "settlement_type"
        case settlementTypeFull = "settlement_type_full"
        case settlement
        case streetFiasID = "street_fias_id"
        case streetKladrID = "street_kladr_id"
        case streetWithType = "street_with_type"
        case streetType = "street_type"
        case streetTypeFull = "street_type_full"
        case street
        case steadFiasID = "stead_fias_id"
        case steadCadnum = "stead_cadnum"
        case steadType = "stead_type"
        case steadTypeFull = "stead_type_full"
        case stead
        case houseFiasID = "house_fias_id"
        case houseKladrID = "house_kladr_id"
        case houseCadnum = "house_cadnum"
        case houseType = "house_type"
        case houseTypeFull = "house_type_full"
        case house
        case blockType = "block_type"
        case blockTypeFull = "block_type_full"
        case block, entrance, floor
        case flatFiasID = "flat_fias_id"
        case flatCadnum = "flat_cadnum"
        case flatType = "flat_type"
        case flatTypeFull = "flat_type_full"
        case flat
        case flatArea = "flat_area"
        case squareMeterPrice = "square_meter_price"
        case flatPrice = "flat_price"
        case postalBox = "postal_box"
        case fiasID = "fias_id"
        case fiasCode = "fias_code"
        case fiasLevel = "fias_level"
        case fiasActualityState = "fias_actuality_state"
        case kladrID = "kladr_id"
        case geonameID = "geoname_id"
        case capitalMarker = "capital_marker"
        case okato, oktmo
        case taxOffice = "tax_office"
        case taxOfficeLegal = "tax_office_legal"
        case timezone
        case geoLat = "geo_lat"
        case geoLon = "geo_lon"
        case beltwayHit = "beltway_hit"
        case beltwayDistance = "beltway_distance"
        case metro, divisions
        case qcGeo = "qc_geo"
        case qcComplete = "qc_complete"
        case qcHouse = "qc_house"
        case historyValues = "history_values"
        case unparsedParts = "unparsed_parts"
        case source, qc
    }
}

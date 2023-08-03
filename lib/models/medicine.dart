class Medicines {
  final String? productNdc;
  final String? genericName;
  final String? labelerName;
  final String? brandName;
  final List<ActiveIngredients>? activeIngredients;
  final bool? finished;
  final List<Packaging>? packaging;
  final String? listingExpirationDate;
  final Openfda? openfda;
  final String? marketingCategory;
  final String? dosageForm;
  final String? splId;
  final String? productType;
  final List<String>? route;
  final String? marketingStartDate;
  final String? productId;
  final String? applicationNumber;
  final String? brandNameBase;
  final List<String>? pharmClass;

  Medicines({
    this.productNdc,
    this.genericName,
    this.labelerName,
    this.brandName,
    this.activeIngredients,
    this.finished,
    this.packaging,
    this.listingExpirationDate,
    this.openfda,
    this.marketingCategory,
    this.dosageForm,
    this.splId,
    this.productType,
    this.route,
    this.marketingStartDate,
    this.productId,
    this.applicationNumber,
    this.brandNameBase,
    this.pharmClass,
  });

  Medicines.fromJson(Map<String, dynamic> json)
      : productNdc = json['product_ndc'] as String?,
        genericName = json['generic_name'] as String?,
        labelerName = json['labeler_name'] as String?,
        brandName = json['brand_name'] as String?,
        activeIngredients = (json['active_ingredients'] as List?)
            ?.map((dynamic e) =>
                ActiveIngredients.fromJson(e as Map<String, dynamic>))
            .toList(),
        finished = json['finished'] as bool?,
        packaging = (json['packaging'] as List?)
            ?.map((dynamic e) => Packaging.fromJson(e as Map<String, dynamic>))
            .toList(),
        listingExpirationDate = json['listing_expiration_date'] as String?,
        openfda = (json['openfda'] as Map<String, dynamic>?) != null
            ? Openfda.fromJson(json['openfda'] as Map<String, dynamic>)
            : null,
        marketingCategory = json['marketing_category'] as String?,
        dosageForm = json['dosage_form'] as String?,
        splId = json['spl_id'] as String?,
        productType = json['product_type'] as String?,
        route =
            (json['route'] as List?)?.map((dynamic e) => e as String).toList(),
        marketingStartDate = json['marketing_start_date'] as String?,
        productId = json['product_id'] as String?,
        applicationNumber = json['application_number'] as String?,
        brandNameBase = json['brand_name_base'] as String?,
        pharmClass = (json['pharm_class'] as List?)
            ?.map((dynamic e) => e as String)
            .toList();

  Map<String, dynamic> toJson() => {
        'product_ndc': productNdc,
        'generic_name': genericName,
        'labeler_name': labelerName,
        'brand_name': brandName,
        'active_ingredients':
            activeIngredients?.map((e) => e.toJson()).toList(),
        'finished': finished,
        'packaging': packaging?.map((e) => e.toJson()).toList(),
        'listing_expiration_date': listingExpirationDate,
        'openfda': openfda?.toJson(),
        'marketing_category': marketingCategory,
        'dosage_form': dosageForm,
        'spl_id': splId,
        'product_type': productType,
        'route': route,
        'marketing_start_date': marketingStartDate,
        'product_id': productId,
        'application_number': applicationNumber,
        'brand_name_base': brandNameBase,
        'pharm_class': pharmClass
      };
}

class ActiveIngredients {
  final String? name;
  final String? strength;

  ActiveIngredients({
    this.name,
    this.strength,
  });

  ActiveIngredients.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        strength = json['strength'] as String?;

  Map<String, dynamic> toJson() => {'name': name, 'strength': strength};
}

class Packaging {
  final String? packageNdc;
  final String? description;
  final String? marketingStartDate;
  final bool? sample;

  Packaging({
    this.packageNdc,
    this.description,
    this.marketingStartDate,
    this.sample,
  });

  Packaging.fromJson(Map<String, dynamic> json)
      : packageNdc = json['package_ndc'] as String?,
        description = json['description'] as String?,
        marketingStartDate = json['marketing_start_date'] as String?,
        sample = json['sample'] as bool?;

  Map<String, dynamic> toJson() => {
        'package_ndc': packageNdc,
        'description': description,
        'marketing_start_date': marketingStartDate,
        'sample': sample
      };
}

class Openfda {
  final List<String>? manufacturerName;
  final List<String>? rxcui;
  final List<String>? splSetId;
  final List<bool>? isOriginalPackager;
  final List<String>? nui;
  final List<String>? pharmClassMoa;
  final List<String>? pharmClassCs;
  final List<String>? pharmClassEpc;
  final List<String>? unii;

  Openfda({
    this.manufacturerName,
    this.rxcui,
    this.splSetId,
    this.isOriginalPackager,
    this.nui,
    this.pharmClassMoa,
    this.pharmClassCs,
    this.pharmClassEpc,
    this.unii,
  });

  Openfda.fromJson(Map<String, dynamic> json)
      : manufacturerName = (json['manufacturer_name'] as List?)
            ?.map((dynamic e) => e as String)
            .toList(),
        rxcui =
            (json['rxcui'] as List?)?.map((dynamic e) => e as String).toList(),
        splSetId = (json['spl_set_id'] as List?)
            ?.map((dynamic e) => e as String)
            .toList(),
        isOriginalPackager = (json['is_original_packager'] as List?)
            ?.map((dynamic e) => e as bool)
            .toList(),
        nui = (json['nui'] as List?)?.map((dynamic e) => e as String).toList(),
        pharmClassMoa = (json['pharm_class_moa'] as List?)
            ?.map((dynamic e) => e as String)
            .toList(),
        pharmClassCs = (json['pharm_class_cs'] as List?)
            ?.map((dynamic e) => e as String)
            .toList(),
        pharmClassEpc = (json['pharm_class_epc'] as List?)
            ?.map((dynamic e) => e as String)
            .toList(),
        unii =
            (json['unii'] as List?)?.map((dynamic e) => e as String).toList();

  Map<String, dynamic> toJson() => {
        'manufacturer_name': manufacturerName,
        'rxcui': rxcui,
        'spl_set_id': splSetId,
        'is_original_packager': isOriginalPackager,
        'nui': nui,
        'pharm_class_moa': pharmClassMoa,
        'pharm_class_cs': pharmClassCs,
        'pharm_class_epc': pharmClassEpc,
        'unii': unii
      };
}

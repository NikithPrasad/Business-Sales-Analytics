let
    // Update this one value when the repository is cloned elsewhere.
    FilePath = "E:\\Nikith_Projects\\Business-Sales-Analytics\\data\\Superstore.csv",
    Source = Csv.Document(
        File.Contents(FilePath),
        [Delimiter = ",", Columns = 21, Encoding = 1252, QuoteStyle = QuoteStyle.Csv]
    ),
    PromotedHeaders = Table.PromoteHeaders(Source, [PromoteAllScalars = true]),
    TypedColumns = Table.TransformColumnTypes(
        PromotedHeaders,
        {
            {"Row ID", Int64.Type}, {"Order ID", type text}, {"Order Date", type text},
            {"Ship Date", type text}, {"Ship Mode", type text}, {"Customer ID", type text},
            {"Customer Name", type text}, {"Segment", type text}, {"Country", type text},
            {"City", type text}, {"State", type text}, {"Postal Code", type text},
            {"Region", type text}, {"Product ID", type text}, {"Category", type text},
            {"Sub-Category", type text}, {"Product Name", type text}, {"Sales", Currency.Type},
            {"Quantity", Int64.Type}, {"Discount", Percentage.Type}, {"Profit", Currency.Type}
        }
    ),
    ParsedOrderDate = Table.TransformColumns(
        TypedColumns,
        {{"Order Date", each Date.FromText(_, [Format = "dd-MM-yyyy", Culture = "en-GB"]), type date}}
    ),
    ParsedShipDate = Table.TransformColumns(
        ParsedOrderDate,
        {{"Ship Date", each Date.FromText(_, [Format = "dd-MM-yyyy", Culture = "en-GB"]), type date}}
    ),
    AddedShipDays = Table.AddColumn(
        ParsedShipDate,
        "Shipping Days",
        each Duration.Days([Ship Date] - [Order Date]),
        Int64.Type
    ),
    AddedDiscountBand = Table.AddColumn(
        AddedShipDays,
        "Discount Band",
        each if [Discount] = 0 then "0%"
        else if [Discount] <= 0.10 then "1–10%"
        else if [Discount] <= 0.20 then "11–20%"
        else if [Discount] <= 0.30 then "21–30%"
        else "31%+",
        type text
    )
in
    AddedDiscountBand

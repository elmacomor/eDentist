using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace eDentist.Services.Migrations
{
    /// <inheritdoc />
    public partial class NewTransactionsTable : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<DateTime>(
                name: "Datum",
                table: "Transactions",
                type: "datetime2",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "UserId",
                table: "Transactions",
                type: "int",
                nullable: true);

            migrationBuilder.CreateTable(
                name: "TransakcijaZaUslugu",
                columns: table => new
                {
                    TranskcijaId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    DentalServiceId = table.Column<int>(type: "int", nullable: true),
                    Amount = table.Column<double>(type: "float", nullable: true),
                    TransactionStatus = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    TransId = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    UserId = table.Column<int>(type: "int", nullable: true),
                    Datum = table.Column<DateTime>(type: "datetime2", nullable: true),
                    SvrhaUplate = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_TransakcijaZaUslugu", x => x.TranskcijaId);
                    table.ForeignKey(
                        name: "FK_TransakcijaZaUslugu_DentalService_DentalServiceId",
                        column: x => x.DentalServiceId,
                        principalTable: "DentalService",
                        principalColumn: "DentalServiceID");
                    table.ForeignKey(
                        name: "FK_TransakcijaZaUslugu_Users_UserId",
                        column: x => x.UserId,
                        principalTable: "Users",
                        principalColumn: "UserID");
                });

            migrationBuilder.UpdateData(
                table: "Appointments",
                keyColumn: "AppointmentID",
                keyValue: 1,
                columns: new[] { "Datum", "UserIdDentist" },
                values: new object[] { new DateTime(2024, 6, 8, 11, 48, 2, 373, DateTimeKind.Local).AddTicks(1275), 1 });

            migrationBuilder.UpdateData(
                table: "MedicalCard",
                keyColumn: "MedicalCardID",
                keyValue: 1,
                column: "datumDijagnoze",
                value: new DateTime(2024, 6, 8, 11, 48, 2, 373, DateTimeKind.Local).AddTicks(1340));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 1,
                column: "OrderDate",
                value: new DateTime(2024, 6, 8, 11, 48, 2, 373, DateTimeKind.Local).AddTicks(7555));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 2,
                column: "OrderDate",
                value: new DateTime(2024, 6, 8, 11, 48, 2, 373, DateTimeKind.Local).AddTicks(7610));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 3,
                column: "OrderDate",
                value: new DateTime(2024, 6, 8, 11, 48, 2, 373, DateTimeKind.Local).AddTicks(7657));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 4,
                column: "OrderDate",
                value: new DateTime(2024, 6, 8, 11, 48, 2, 373, DateTimeKind.Local).AddTicks(7688));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 5,
                column: "OrderDate",
                value: new DateTime(2024, 6, 8, 11, 48, 2, 373, DateTimeKind.Local).AddTicks(7775));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 6,
                column: "OrderDate",
                value: new DateTime(2024, 6, 8, 11, 48, 2, 373, DateTimeKind.Local).AddTicks(7805));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 7,
                column: "OrderDate",
                value: new DateTime(2024, 6, 8, 11, 48, 2, 373, DateTimeKind.Local).AddTicks(7835));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 8,
                column: "OrderDate",
                value: new DateTime(2024, 6, 8, 11, 48, 2, 373, DateTimeKind.Local).AddTicks(7863));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 9,
                column: "OrderDate",
                value: new DateTime(2024, 6, 8, 11, 48, 2, 373, DateTimeKind.Local).AddTicks(7890));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 10,
                column: "OrderDate",
                value: new DateTime(2024, 6, 8, 11, 48, 2, 373, DateTimeKind.Local).AddTicks(7955));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 11,
                column: "OrderDate",
                value: new DateTime(2024, 6, 8, 11, 48, 2, 373, DateTimeKind.Local).AddTicks(7984));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 12,
                column: "OrderDate",
                value: new DateTime(2024, 6, 8, 11, 48, 2, 373, DateTimeKind.Local).AddTicks(8012));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 13,
                column: "OrderDate",
                value: new DateTime(2024, 6, 8, 11, 48, 2, 373, DateTimeKind.Local).AddTicks(8040));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 14,
                column: "OrderDate",
                value: new DateTime(2024, 6, 8, 11, 48, 2, 373, DateTimeKind.Local).AddTicks(8067));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 15,
                column: "OrderDate",
                value: new DateTime(2024, 6, 8, 11, 48, 2, 373, DateTimeKind.Local).AddTicks(8133));

            migrationBuilder.UpdateData(
                table: "Transactions",
                keyColumn: "TranskcijaId",
                keyValue: 1,
                columns: new[] { "Datum", "UserId" },
                values: new object[] { new DateTime(2024, 6, 8, 11, 48, 2, 373, DateTimeKind.Local).AddTicks(7576), 2 });

            migrationBuilder.UpdateData(
                table: "Transactions",
                keyColumn: "TranskcijaId",
                keyValue: 2,
                columns: new[] { "Datum", "UserId" },
                values: new object[] { new DateTime(2024, 6, 8, 11, 48, 2, 373, DateTimeKind.Local).AddTicks(7618), 2 });

            migrationBuilder.UpdateData(
                table: "Transactions",
                keyColumn: "TranskcijaId",
                keyValue: 3,
                columns: new[] { "Datum", "UserId" },
                values: new object[] { new DateTime(2024, 6, 8, 11, 48, 2, 373, DateTimeKind.Local).AddTicks(7665), 2 });

            migrationBuilder.UpdateData(
                table: "Transactions",
                keyColumn: "TranskcijaId",
                keyValue: 4,
                columns: new[] { "Datum", "UserId" },
                values: new object[] { new DateTime(2024, 6, 8, 11, 48, 2, 373, DateTimeKind.Local).AddTicks(7695), 2 });

            migrationBuilder.UpdateData(
                table: "Transactions",
                keyColumn: "TranskcijaId",
                keyValue: 5,
                columns: new[] { "Datum", "UserId" },
                values: new object[] { new DateTime(2024, 6, 8, 11, 48, 2, 373, DateTimeKind.Local).AddTicks(7783), 2 });

            migrationBuilder.UpdateData(
                table: "Transactions",
                keyColumn: "TranskcijaId",
                keyValue: 6,
                columns: new[] { "Datum", "UserId" },
                values: new object[] { new DateTime(2024, 6, 8, 11, 48, 2, 373, DateTimeKind.Local).AddTicks(7812), 2 });

            migrationBuilder.UpdateData(
                table: "Transactions",
                keyColumn: "TranskcijaId",
                keyValue: 7,
                columns: new[] { "Datum", "UserId" },
                values: new object[] { new DateTime(2024, 6, 8, 11, 48, 2, 373, DateTimeKind.Local).AddTicks(7843), 2 });

            migrationBuilder.UpdateData(
                table: "Transactions",
                keyColumn: "TranskcijaId",
                keyValue: 8,
                columns: new[] { "Datum", "UserId" },
                values: new object[] { new DateTime(2024, 6, 8, 11, 48, 2, 373, DateTimeKind.Local).AddTicks(7869), 2 });

            migrationBuilder.UpdateData(
                table: "Transactions",
                keyColumn: "TranskcijaId",
                keyValue: 9,
                columns: new[] { "Datum", "UserId" },
                values: new object[] { new DateTime(2024, 6, 8, 11, 48, 2, 373, DateTimeKind.Local).AddTicks(7898), 2 });

            migrationBuilder.UpdateData(
                table: "Transactions",
                keyColumn: "TranskcijaId",
                keyValue: 10,
                columns: new[] { "Datum", "UserId" },
                values: new object[] { new DateTime(2024, 6, 8, 11, 48, 2, 373, DateTimeKind.Local).AddTicks(7963), 2 });

            migrationBuilder.UpdateData(
                table: "Transactions",
                keyColumn: "TranskcijaId",
                keyValue: 11,
                columns: new[] { "Datum", "UserId" },
                values: new object[] { new DateTime(2024, 6, 8, 11, 48, 2, 373, DateTimeKind.Local).AddTicks(7991), 2 });

            migrationBuilder.UpdateData(
                table: "Transactions",
                keyColumn: "TranskcijaId",
                keyValue: 12,
                columns: new[] { "Datum", "UserId" },
                values: new object[] { new DateTime(2024, 6, 8, 11, 48, 2, 373, DateTimeKind.Local).AddTicks(8019), 2 });

            migrationBuilder.UpdateData(
                table: "Transactions",
                keyColumn: "TranskcijaId",
                keyValue: 13,
                columns: new[] { "Datum", "UserId" },
                values: new object[] { new DateTime(2024, 6, 8, 11, 48, 2, 373, DateTimeKind.Local).AddTicks(8047), 2 });

            migrationBuilder.UpdateData(
                table: "Transactions",
                keyColumn: "TranskcijaId",
                keyValue: 14,
                columns: new[] { "Datum", "UserId" },
                values: new object[] { new DateTime(2024, 6, 8, 11, 48, 2, 373, DateTimeKind.Local).AddTicks(8110), 2 });

            migrationBuilder.UpdateData(
                table: "Transactions",
                keyColumn: "TranskcijaId",
                keyValue: 15,
                columns: new[] { "Datum", "UserId" },
                values: new object[] { new DateTime(2024, 6, 8, 11, 48, 2, 373, DateTimeKind.Local).AddTicks(8141), 2 });

            migrationBuilder.InsertData(
                table: "TransakcijaZaUslugu",
                columns: new[] { "TranskcijaId", "Amount", "Datum", "DentalServiceId", "SvrhaUplate", "TransId", "TransactionStatus", "UserId" },
                values: new object[] { 1, 50.0, new DateTime(2024, 6, 8, 11, 48, 2, 373, DateTimeKind.Local).AddTicks(8168), 1, null, "PAYID-MXPGHDI82U242769W004564A", "Success", 2 });

            migrationBuilder.CreateIndex(
                name: "IX_Transactions_UserId",
                table: "Transactions",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_TransakcijaZaUslugu_DentalServiceId",
                table: "TransakcijaZaUslugu",
                column: "DentalServiceId");

            migrationBuilder.CreateIndex(
                name: "IX_TransakcijaZaUslugu_UserId",
                table: "TransakcijaZaUslugu",
                column: "UserId");

            migrationBuilder.AddForeignKey(
                name: "FK_Transactions_Users_UserId",
                table: "Transactions",
                column: "UserId",
                principalTable: "Users",
                principalColumn: "UserID");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Transactions_Users_UserId",
                table: "Transactions");

            migrationBuilder.DropTable(
                name: "TransakcijaZaUslugu");

            migrationBuilder.DropIndex(
                name: "IX_Transactions_UserId",
                table: "Transactions");

            migrationBuilder.DropColumn(
                name: "Datum",
                table: "Transactions");

            migrationBuilder.DropColumn(
                name: "UserId",
                table: "Transactions");

            migrationBuilder.UpdateData(
                table: "Appointments",
                keyColumn: "AppointmentID",
                keyValue: 1,
                columns: new[] { "Datum", "UserIdDentist" },
                values: new object[] { new DateTime(2024, 6, 5, 23, 1, 57, 37, DateTimeKind.Local).AddTicks(8810), null });

            migrationBuilder.UpdateData(
                table: "MedicalCard",
                keyColumn: "MedicalCardID",
                keyValue: 1,
                column: "datumDijagnoze",
                value: new DateTime(2024, 6, 5, 23, 1, 57, 37, DateTimeKind.Local).AddTicks(8887));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 1,
                column: "OrderDate",
                value: new DateTime(2024, 6, 5, 23, 1, 57, 38, DateTimeKind.Local).AddTicks(7820));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 2,
                column: "OrderDate",
                value: new DateTime(2024, 6, 5, 23, 1, 57, 38, DateTimeKind.Local).AddTicks(7904));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 3,
                column: "OrderDate",
                value: new DateTime(2024, 6, 5, 23, 1, 57, 38, DateTimeKind.Local).AddTicks(7980));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 4,
                column: "OrderDate",
                value: new DateTime(2024, 6, 5, 23, 1, 57, 38, DateTimeKind.Local).AddTicks(8017));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 5,
                column: "OrderDate",
                value: new DateTime(2024, 6, 5, 23, 1, 57, 38, DateTimeKind.Local).AddTicks(8108));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 6,
                column: "OrderDate",
                value: new DateTime(2024, 6, 5, 23, 1, 57, 38, DateTimeKind.Local).AddTicks(8148));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 7,
                column: "OrderDate",
                value: new DateTime(2024, 6, 5, 23, 1, 57, 38, DateTimeKind.Local).AddTicks(8183));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 8,
                column: "OrderDate",
                value: new DateTime(2024, 6, 5, 23, 1, 57, 38, DateTimeKind.Local).AddTicks(8216));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 9,
                column: "OrderDate",
                value: new DateTime(2024, 6, 5, 23, 1, 57, 38, DateTimeKind.Local).AddTicks(8248));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 10,
                column: "OrderDate",
                value: new DateTime(2024, 6, 5, 23, 1, 57, 38, DateTimeKind.Local).AddTicks(8327));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 11,
                column: "OrderDate",
                value: new DateTime(2024, 6, 5, 23, 1, 57, 38, DateTimeKind.Local).AddTicks(8361));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 12,
                column: "OrderDate",
                value: new DateTime(2024, 6, 5, 23, 1, 57, 38, DateTimeKind.Local).AddTicks(8394));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 13,
                column: "OrderDate",
                value: new DateTime(2024, 6, 5, 23, 1, 57, 38, DateTimeKind.Local).AddTicks(8426));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 14,
                column: "OrderDate",
                value: new DateTime(2024, 6, 5, 23, 1, 57, 38, DateTimeKind.Local).AddTicks(8458));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 15,
                column: "OrderDate",
                value: new DateTime(2024, 6, 5, 23, 1, 57, 38, DateTimeKind.Local).AddTicks(8533));
        }
    }
}

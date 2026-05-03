using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace eDentist.Services.Migrations
{
    /// <inheritdoc />
    public partial class MigABCd : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.UpdateData(
                table: "Appointments",
                keyColumn: "AppointmentID",
                keyValue: 1,
                column: "Datum",
                value: new DateTime(2024, 3, 16, 14, 3, 52, 641, DateTimeKind.Local).AddTicks(4080));

            migrationBuilder.UpdateData(
                table: "MedicalCard",
                keyColumn: "MedicalCardID",
                keyValue: 1,
                column: "datumDijagnoze",
                value: new DateTime(2024, 3, 16, 14, 3, 52, 641, DateTimeKind.Local).AddTicks(4179));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 1,
                column: "OrderDate",
                value: new DateTime(2024, 3, 16, 14, 3, 52, 642, DateTimeKind.Local).AddTicks(1856));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 2,
                column: "OrderDate",
                value: new DateTime(2024, 3, 16, 14, 3, 52, 642, DateTimeKind.Local).AddTicks(1959));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 3,
                column: "OrderDate",
                value: new DateTime(2024, 3, 16, 14, 3, 52, 642, DateTimeKind.Local).AddTicks(2058));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 4,
                column: "OrderDate",
                value: new DateTime(2024, 3, 16, 14, 3, 52, 642, DateTimeKind.Local).AddTicks(2125));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 5,
                column: "OrderDate",
                value: new DateTime(2024, 3, 16, 14, 3, 52, 642, DateTimeKind.Local).AddTicks(2191));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 6,
                column: "OrderDate",
                value: new DateTime(2024, 3, 16, 14, 3, 52, 642, DateTimeKind.Local).AddTicks(2319));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 7,
                column: "OrderDate",
                value: new DateTime(2024, 3, 16, 14, 3, 52, 642, DateTimeKind.Local).AddTicks(2387));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 8,
                column: "OrderDate",
                value: new DateTime(2024, 3, 16, 14, 3, 52, 642, DateTimeKind.Local).AddTicks(2451));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 9,
                column: "OrderDate",
                value: new DateTime(2024, 3, 16, 14, 3, 52, 642, DateTimeKind.Local).AddTicks(2516));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 10,
                column: "OrderDate",
                value: new DateTime(2024, 3, 16, 14, 3, 52, 642, DateTimeKind.Local).AddTicks(2633));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 11,
                column: "OrderDate",
                value: new DateTime(2024, 3, 16, 14, 3, 52, 642, DateTimeKind.Local).AddTicks(2702));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 12,
                column: "OrderDate",
                value: new DateTime(2024, 3, 16, 14, 3, 52, 642, DateTimeKind.Local).AddTicks(2768));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 13,
                column: "OrderDate",
                value: new DateTime(2024, 3, 16, 14, 3, 52, 642, DateTimeKind.Local).AddTicks(2831));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 14,
                column: "OrderDate",
                value: new DateTime(2024, 3, 16, 14, 3, 52, 642, DateTimeKind.Local).AddTicks(2898));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 15,
                column: "OrderDate",
                value: new DateTime(2024, 3, 16, 14, 3, 52, 642, DateTimeKind.Local).AddTicks(3007));
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.UpdateData(
                table: "Appointments",
                keyColumn: "AppointmentID",
                keyValue: 1,
                column: "Datum",
                value: new DateTime(2024, 3, 16, 13, 56, 19, 339, DateTimeKind.Local).AddTicks(8835));

            migrationBuilder.UpdateData(
                table: "MedicalCard",
                keyColumn: "MedicalCardID",
                keyValue: 1,
                column: "datumDijagnoze",
                value: new DateTime(2024, 3, 16, 13, 56, 19, 339, DateTimeKind.Local).AddTicks(8899));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 1,
                column: "OrderDate",
                value: new DateTime(2024, 3, 16, 13, 56, 19, 340, DateTimeKind.Local).AddTicks(5036));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 2,
                column: "OrderDate",
                value: new DateTime(2024, 3, 16, 13, 56, 19, 340, DateTimeKind.Local).AddTicks(5129));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 3,
                column: "OrderDate",
                value: new DateTime(2024, 3, 16, 13, 56, 19, 340, DateTimeKind.Local).AddTicks(5180));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 4,
                column: "OrderDate",
                value: new DateTime(2024, 3, 16, 13, 56, 19, 340, DateTimeKind.Local).AddTicks(5210));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 5,
                column: "OrderDate",
                value: new DateTime(2024, 3, 16, 13, 56, 19, 340, DateTimeKind.Local).AddTicks(5239));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 6,
                column: "OrderDate",
                value: new DateTime(2024, 3, 16, 13, 56, 19, 340, DateTimeKind.Local).AddTicks(5269));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 7,
                column: "OrderDate",
                value: new DateTime(2024, 3, 16, 13, 56, 19, 340, DateTimeKind.Local).AddTicks(5332));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 8,
                column: "OrderDate",
                value: new DateTime(2024, 3, 16, 13, 56, 19, 340, DateTimeKind.Local).AddTicks(5358));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 9,
                column: "OrderDate",
                value: new DateTime(2024, 3, 16, 13, 56, 19, 340, DateTimeKind.Local).AddTicks(5385));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 10,
                column: "OrderDate",
                value: new DateTime(2024, 3, 16, 13, 56, 19, 340, DateTimeKind.Local).AddTicks(5413));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 11,
                column: "OrderDate",
                value: new DateTime(2024, 3, 16, 13, 56, 19, 340, DateTimeKind.Local).AddTicks(5440));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 12,
                column: "OrderDate",
                value: new DateTime(2024, 3, 16, 13, 56, 19, 340, DateTimeKind.Local).AddTicks(5472));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 13,
                column: "OrderDate",
                value: new DateTime(2024, 3, 16, 13, 56, 19, 340, DateTimeKind.Local).AddTicks(5539));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 14,
                column: "OrderDate",
                value: new DateTime(2024, 3, 16, 13, 56, 19, 340, DateTimeKind.Local).AddTicks(5567));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 15,
                column: "OrderDate",
                value: new DateTime(2024, 3, 16, 13, 56, 19, 340, DateTimeKind.Local).AddTicks(5595));
        }
    }
}

using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace eDentist.Services.Migrations
{
    /// <inheritdoc />
    public partial class Appointmentdoctor : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "UserIdDentist",
                table: "Appointments",
                type: "int",
                nullable: true);

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

            migrationBuilder.CreateIndex(
                name: "IX_Appointments_UserIdDentist",
                table: "Appointments",
                column: "UserIdDentist");

            migrationBuilder.AddForeignKey(
                name: "FK_Appointments_Users_UserIdDentist",
                table: "Appointments",
                column: "UserIdDentist",
                principalTable: "Users",
                principalColumn: "UserID");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Appointments_Users_UserIdDentist",
                table: "Appointments");

            migrationBuilder.DropIndex(
                name: "IX_Appointments_UserIdDentist",
                table: "Appointments");

            migrationBuilder.DropColumn(
                name: "UserIdDentist",
                table: "Appointments");

            migrationBuilder.UpdateData(
                table: "Appointments",
                keyColumn: "AppointmentID",
                keyValue: 1,
                column: "Datum",
                value: new DateTime(2024, 4, 7, 11, 11, 51, 201, DateTimeKind.Local).AddTicks(6716));

            migrationBuilder.UpdateData(
                table: "MedicalCard",
                keyColumn: "MedicalCardID",
                keyValue: 1,
                column: "datumDijagnoze",
                value: new DateTime(2024, 4, 7, 11, 11, 51, 201, DateTimeKind.Local).AddTicks(6796));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 1,
                column: "OrderDate",
                value: new DateTime(2024, 4, 7, 11, 11, 51, 202, DateTimeKind.Local).AddTicks(1884));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 2,
                column: "OrderDate",
                value: new DateTime(2024, 4, 7, 11, 11, 51, 202, DateTimeKind.Local).AddTicks(1935));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 3,
                column: "OrderDate",
                value: new DateTime(2024, 4, 7, 11, 11, 51, 202, DateTimeKind.Local).AddTicks(1979));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 4,
                column: "OrderDate",
                value: new DateTime(2024, 4, 7, 11, 11, 51, 202, DateTimeKind.Local).AddTicks(2008));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 5,
                column: "OrderDate",
                value: new DateTime(2024, 4, 7, 11, 11, 51, 202, DateTimeKind.Local).AddTicks(2066));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 6,
                column: "OrderDate",
                value: new DateTime(2024, 4, 7, 11, 11, 51, 202, DateTimeKind.Local).AddTicks(2094));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 7,
                column: "OrderDate",
                value: new DateTime(2024, 4, 7, 11, 11, 51, 202, DateTimeKind.Local).AddTicks(2120));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 8,
                column: "OrderDate",
                value: new DateTime(2024, 4, 7, 11, 11, 51, 202, DateTimeKind.Local).AddTicks(2146));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 9,
                column: "OrderDate",
                value: new DateTime(2024, 4, 7, 11, 11, 51, 202, DateTimeKind.Local).AddTicks(2172));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 10,
                column: "OrderDate",
                value: new DateTime(2024, 4, 7, 11, 11, 51, 202, DateTimeKind.Local).AddTicks(2226));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 11,
                column: "OrderDate",
                value: new DateTime(2024, 4, 7, 11, 11, 51, 202, DateTimeKind.Local).AddTicks(2253));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 12,
                column: "OrderDate",
                value: new DateTime(2024, 4, 7, 11, 11, 51, 202, DateTimeKind.Local).AddTicks(2279));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 13,
                column: "OrderDate",
                value: new DateTime(2024, 4, 7, 11, 11, 51, 202, DateTimeKind.Local).AddTicks(2305));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 14,
                column: "OrderDate",
                value: new DateTime(2024, 4, 7, 11, 11, 51, 202, DateTimeKind.Local).AddTicks(2360));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 15,
                column: "OrderDate",
                value: new DateTime(2024, 4, 7, 11, 11, 51, 202, DateTimeKind.Local).AddTicks(2386));
        }
    }
}

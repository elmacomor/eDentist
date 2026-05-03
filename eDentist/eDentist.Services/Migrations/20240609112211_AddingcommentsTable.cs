using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace eDentist.Services.Migrations
{
    /// <inheritdoc />
    public partial class AddingcommentsTable : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Comment",
                columns: table => new
                {
                    CommentID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    UserId = table.Column<int>(type: "int", nullable: false),
                    Datum = table.Column<DateTime>(type: "datetime2", nullable: false),
                    BlogId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Comment", x => x.CommentID);
                    table.ForeignKey(
                        name: "FK_Comment_BlogPosts_BlogId",
                        column: x => x.BlogId,
                        principalTable: "BlogPosts",
                        principalColumn: "BlogId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_Comment_Users_UserId",
                        column: x => x.UserId,
                        principalTable: "Users",
                        principalColumn: "UserID",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.UpdateData(
                table: "Appointments",
                keyColumn: "AppointmentID",
                keyValue: 1,
                column: "Datum",
                value: new DateTime(2024, 6, 9, 13, 22, 11, 237, DateTimeKind.Local).AddTicks(3725));

            migrationBuilder.UpdateData(
                table: "MedicalCard",
                keyColumn: "MedicalCardID",
                keyValue: 1,
                column: "datumDijagnoze",
                value: new DateTime(2024, 6, 9, 13, 22, 11, 237, DateTimeKind.Local).AddTicks(3777));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 1,
                column: "OrderDate",
                value: new DateTime(2024, 6, 9, 13, 22, 11, 237, DateTimeKind.Local).AddTicks(8564));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 2,
                column: "OrderDate",
                value: new DateTime(2024, 6, 9, 13, 22, 11, 237, DateTimeKind.Local).AddTicks(8616));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 3,
                column: "OrderDate",
                value: new DateTime(2024, 6, 9, 13, 22, 11, 237, DateTimeKind.Local).AddTicks(8655));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 4,
                column: "OrderDate",
                value: new DateTime(2024, 6, 9, 13, 22, 11, 237, DateTimeKind.Local).AddTicks(8677));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 5,
                column: "OrderDate",
                value: new DateTime(2024, 6, 9, 13, 22, 11, 237, DateTimeKind.Local).AddTicks(8730));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 6,
                column: "OrderDate",
                value: new DateTime(2024, 6, 9, 13, 22, 11, 237, DateTimeKind.Local).AddTicks(8751));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 7,
                column: "OrderDate",
                value: new DateTime(2024, 6, 9, 13, 22, 11, 237, DateTimeKind.Local).AddTicks(8773));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 8,
                column: "OrderDate",
                value: new DateTime(2024, 6, 9, 13, 22, 11, 237, DateTimeKind.Local).AddTicks(8793));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 9,
                column: "OrderDate",
                value: new DateTime(2024, 6, 9, 13, 22, 11, 237, DateTimeKind.Local).AddTicks(8812));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 10,
                column: "OrderDate",
                value: new DateTime(2024, 6, 9, 13, 22, 11, 237, DateTimeKind.Local).AddTicks(8866));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 11,
                column: "OrderDate",
                value: new DateTime(2024, 6, 9, 13, 22, 11, 237, DateTimeKind.Local).AddTicks(8887));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 12,
                column: "OrderDate",
                value: new DateTime(2024, 6, 9, 13, 22, 11, 237, DateTimeKind.Local).AddTicks(8907));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 13,
                column: "OrderDate",
                value: new DateTime(2024, 6, 9, 13, 22, 11, 237, DateTimeKind.Local).AddTicks(8927));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 14,
                column: "OrderDate",
                value: new DateTime(2024, 6, 9, 13, 22, 11, 237, DateTimeKind.Local).AddTicks(8974));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 15,
                column: "OrderDate",
                value: new DateTime(2024, 6, 9, 13, 22, 11, 237, DateTimeKind.Local).AddTicks(8995));

            migrationBuilder.UpdateData(
                table: "Transactions",
                keyColumn: "TranskcijaId",
                keyValue: 1,
                column: "Datum",
                value: new DateTime(2024, 6, 9, 13, 22, 11, 237, DateTimeKind.Local).AddTicks(8588));

            migrationBuilder.UpdateData(
                table: "Transactions",
                keyColumn: "TranskcijaId",
                keyValue: 2,
                column: "Datum",
                value: new DateTime(2024, 6, 9, 13, 22, 11, 237, DateTimeKind.Local).AddTicks(8622));

            migrationBuilder.UpdateData(
                table: "Transactions",
                keyColumn: "TranskcijaId",
                keyValue: 3,
                column: "Datum",
                value: new DateTime(2024, 6, 9, 13, 22, 11, 237, DateTimeKind.Local).AddTicks(8661));

            migrationBuilder.UpdateData(
                table: "Transactions",
                keyColumn: "TranskcijaId",
                keyValue: 4,
                column: "Datum",
                value: new DateTime(2024, 6, 9, 13, 22, 11, 237, DateTimeKind.Local).AddTicks(8682));

            migrationBuilder.UpdateData(
                table: "Transactions",
                keyColumn: "TranskcijaId",
                keyValue: 5,
                column: "Datum",
                value: new DateTime(2024, 6, 9, 13, 22, 11, 237, DateTimeKind.Local).AddTicks(8736));

            migrationBuilder.UpdateData(
                table: "Transactions",
                keyColumn: "TranskcijaId",
                keyValue: 6,
                column: "Datum",
                value: new DateTime(2024, 6, 9, 13, 22, 11, 237, DateTimeKind.Local).AddTicks(8757));

            migrationBuilder.UpdateData(
                table: "Transactions",
                keyColumn: "TranskcijaId",
                keyValue: 7,
                column: "Datum",
                value: new DateTime(2024, 6, 9, 13, 22, 11, 237, DateTimeKind.Local).AddTicks(8778));

            migrationBuilder.UpdateData(
                table: "Transactions",
                keyColumn: "TranskcijaId",
                keyValue: 8,
                column: "Datum",
                value: new DateTime(2024, 6, 9, 13, 22, 11, 237, DateTimeKind.Local).AddTicks(8798));

            migrationBuilder.UpdateData(
                table: "Transactions",
                keyColumn: "TranskcijaId",
                keyValue: 9,
                column: "Datum",
                value: new DateTime(2024, 6, 9, 13, 22, 11, 237, DateTimeKind.Local).AddTicks(8848));

            migrationBuilder.UpdateData(
                table: "Transactions",
                keyColumn: "TranskcijaId",
                keyValue: 10,
                column: "Datum",
                value: new DateTime(2024, 6, 9, 13, 22, 11, 237, DateTimeKind.Local).AddTicks(8871));

            migrationBuilder.UpdateData(
                table: "Transactions",
                keyColumn: "TranskcijaId",
                keyValue: 11,
                column: "Datum",
                value: new DateTime(2024, 6, 9, 13, 22, 11, 237, DateTimeKind.Local).AddTicks(8892));

            migrationBuilder.UpdateData(
                table: "Transactions",
                keyColumn: "TranskcijaId",
                keyValue: 12,
                column: "Datum",
                value: new DateTime(2024, 6, 9, 13, 22, 11, 237, DateTimeKind.Local).AddTicks(8912));

            migrationBuilder.UpdateData(
                table: "Transactions",
                keyColumn: "TranskcijaId",
                keyValue: 13,
                column: "Datum",
                value: new DateTime(2024, 6, 9, 13, 22, 11, 237, DateTimeKind.Local).AddTicks(8932));

            migrationBuilder.UpdateData(
                table: "Transactions",
                keyColumn: "TranskcijaId",
                keyValue: 14,
                column: "Datum",
                value: new DateTime(2024, 6, 9, 13, 22, 11, 237, DateTimeKind.Local).AddTicks(8980));

            migrationBuilder.UpdateData(
                table: "Transactions",
                keyColumn: "TranskcijaId",
                keyValue: 15,
                column: "Datum",
                value: new DateTime(2024, 6, 9, 13, 22, 11, 237, DateTimeKind.Local).AddTicks(9000));

            migrationBuilder.UpdateData(
                table: "TransakcijaZaUslugu",
                keyColumn: "TranskcijaId",
                keyValue: 1,
                column: "Datum",
                value: new DateTime(2024, 6, 9, 13, 22, 11, 237, DateTimeKind.Local).AddTicks(9020));

            migrationBuilder.CreateIndex(
                name: "IX_Comment_BlogId",
                table: "Comment",
                column: "BlogId");

            migrationBuilder.CreateIndex(
                name: "IX_Comment_UserId",
                table: "Comment",
                column: "UserId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Comment");

            migrationBuilder.UpdateData(
                table: "Appointments",
                keyColumn: "AppointmentID",
                keyValue: 1,
                column: "Datum",
                value: new DateTime(2024, 6, 8, 11, 48, 2, 373, DateTimeKind.Local).AddTicks(1275));

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
                column: "Datum",
                value: new DateTime(2024, 6, 8, 11, 48, 2, 373, DateTimeKind.Local).AddTicks(7576));

            migrationBuilder.UpdateData(
                table: "Transactions",
                keyColumn: "TranskcijaId",
                keyValue: 2,
                column: "Datum",
                value: new DateTime(2024, 6, 8, 11, 48, 2, 373, DateTimeKind.Local).AddTicks(7618));

            migrationBuilder.UpdateData(
                table: "Transactions",
                keyColumn: "TranskcijaId",
                keyValue: 3,
                column: "Datum",
                value: new DateTime(2024, 6, 8, 11, 48, 2, 373, DateTimeKind.Local).AddTicks(7665));

            migrationBuilder.UpdateData(
                table: "Transactions",
                keyColumn: "TranskcijaId",
                keyValue: 4,
                column: "Datum",
                value: new DateTime(2024, 6, 8, 11, 48, 2, 373, DateTimeKind.Local).AddTicks(7695));

            migrationBuilder.UpdateData(
                table: "Transactions",
                keyColumn: "TranskcijaId",
                keyValue: 5,
                column: "Datum",
                value: new DateTime(2024, 6, 8, 11, 48, 2, 373, DateTimeKind.Local).AddTicks(7783));

            migrationBuilder.UpdateData(
                table: "Transactions",
                keyColumn: "TranskcijaId",
                keyValue: 6,
                column: "Datum",
                value: new DateTime(2024, 6, 8, 11, 48, 2, 373, DateTimeKind.Local).AddTicks(7812));

            migrationBuilder.UpdateData(
                table: "Transactions",
                keyColumn: "TranskcijaId",
                keyValue: 7,
                column: "Datum",
                value: new DateTime(2024, 6, 8, 11, 48, 2, 373, DateTimeKind.Local).AddTicks(7843));

            migrationBuilder.UpdateData(
                table: "Transactions",
                keyColumn: "TranskcijaId",
                keyValue: 8,
                column: "Datum",
                value: new DateTime(2024, 6, 8, 11, 48, 2, 373, DateTimeKind.Local).AddTicks(7869));

            migrationBuilder.UpdateData(
                table: "Transactions",
                keyColumn: "TranskcijaId",
                keyValue: 9,
                column: "Datum",
                value: new DateTime(2024, 6, 8, 11, 48, 2, 373, DateTimeKind.Local).AddTicks(7898));

            migrationBuilder.UpdateData(
                table: "Transactions",
                keyColumn: "TranskcijaId",
                keyValue: 10,
                column: "Datum",
                value: new DateTime(2024, 6, 8, 11, 48, 2, 373, DateTimeKind.Local).AddTicks(7963));

            migrationBuilder.UpdateData(
                table: "Transactions",
                keyColumn: "TranskcijaId",
                keyValue: 11,
                column: "Datum",
                value: new DateTime(2024, 6, 8, 11, 48, 2, 373, DateTimeKind.Local).AddTicks(7991));

            migrationBuilder.UpdateData(
                table: "Transactions",
                keyColumn: "TranskcijaId",
                keyValue: 12,
                column: "Datum",
                value: new DateTime(2024, 6, 8, 11, 48, 2, 373, DateTimeKind.Local).AddTicks(8019));

            migrationBuilder.UpdateData(
                table: "Transactions",
                keyColumn: "TranskcijaId",
                keyValue: 13,
                column: "Datum",
                value: new DateTime(2024, 6, 8, 11, 48, 2, 373, DateTimeKind.Local).AddTicks(8047));

            migrationBuilder.UpdateData(
                table: "Transactions",
                keyColumn: "TranskcijaId",
                keyValue: 14,
                column: "Datum",
                value: new DateTime(2024, 6, 8, 11, 48, 2, 373, DateTimeKind.Local).AddTicks(8110));

            migrationBuilder.UpdateData(
                table: "Transactions",
                keyColumn: "TranskcijaId",
                keyValue: 15,
                column: "Datum",
                value: new DateTime(2024, 6, 8, 11, 48, 2, 373, DateTimeKind.Local).AddTicks(8141));

            migrationBuilder.UpdateData(
                table: "TransakcijaZaUslugu",
                keyColumn: "TranskcijaId",
                keyValue: 1,
                column: "Datum",
                value: new DateTime(2024, 6, 8, 11, 48, 2, 373, DateTimeKind.Local).AddTicks(8168));
        }
    }
}

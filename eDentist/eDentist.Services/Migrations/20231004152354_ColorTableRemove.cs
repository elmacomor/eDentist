using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace eDentist.Services.Migrations
{
    /// <inheritdoc />
    public partial class ColorTableRemove : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "fk_product_color",
                table: "Products");

            migrationBuilder.DropTable(
                name: "Color");

            migrationBuilder.DropIndex(
                name: "IX_Products_ProductColorID",
                table: "Products");

            migrationBuilder.DropColumn(
                name: "ProductColorID",
                table: "Products");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "ProductColorID",
                table: "Products",
                type: "int",
                nullable: true);

            migrationBuilder.CreateTable(
                name: "Color",
                columns: table => new
                {
                    ColorID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    ColorName = table.Column<string>(type: "varchar(1)", unicode: false, maxLength: 1, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__Color__8DA7676DDE1BD242", x => x.ColorID);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Products_ProductColorID",
                table: "Products",
                column: "ProductColorID");

            migrationBuilder.AddForeignKey(
                name: "fk_product_color",
                table: "Products",
                column: "ProductColorID",
                principalTable: "Color",
                principalColumn: "ColorID");
        }
    }
}
